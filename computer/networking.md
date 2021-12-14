# Networking

## Articles
- [A QUIC look at HTTP/3](https://lwn.net/SubscriberLink/814522/ab3bfaa8f75c60ce/)
- [A visual guide to SSH tunnels](https://robotmoon.com/ssh-tunnels//#)
- [DNS over TLS vs. DNS over HTTPS](https://www.cloudflare.com/learning/dns/dns-over-tls/)
- [Encrypted SNI](https://blog.cloudflare.com/encrypted-sni/)
- [How to route all internet traffic through Tor?](https://askubuntu.com/questions/324685/how-to-route-all-internet-traffic-through-tor-the-onion-router)
- [HTTP/3 Explained](https://http3-explained.haxx.se/en/)
- [Learn with me: VLANs & pfSense](https://www.youtube.com/watch?v=0_unEBSxqGY)
- [Start your own ISP](https://startyourownisp.com/)
- [YSK about firewalls and how they work](https://www.reddit.com/r/networking/comments/ffblzq/ysk_about_firewalls_and_how_they_work/)

## Classes
- [CS249i: The Modern Internet](https://cs249i.stanford.edu/)
- [CSE 291 - Internet Infrastructure](https://cseweb.ucsd.edu/~schulman/class/cse291_f21/)

## Hardware

- **Router**: Connects subnets and translates addresses
  - Routers dont allow broadcasts between subnets
- **Hub**: Sends packets to all ports
- **Switch**: Sends packets to the one (physical) port where the recipient of the packet is
  - [**CAM table**](https://en.wikipedia.org/wiki/Forwarding_information_base) - maps MAC addresses to (physical) ports in a switch
    - How does it build it? Laptop sends out DHCP request with source MAC address, and switch sees it and adds it to CAM table
  - If you [**MAC flood**](https://en.wikipedia.org/wiki/MAC_flooding) a switch (overflow the CAM table), it changes to hub mode
  - Switch is layer 2, doesnt care about IP addresses
- **Access point**: Like a hub, but wiresless. The packets get forwarded to every device (since you can't send waves to just one device), your computer knows to ignore packets thats not for you
  - *Unless* you put your network card in promiscuous mode

[Mac Spoofing](https://en.wikipedia.org/wiki/MAC_spoofing) is a thing.

## 7-Layer Model
### 1 - Physical (802.11, 802.3)

### 2 - Link
#### Ethernet, Tokenring, ARP [FRAME]
- `DST MAC (6bytes), SRC MAC (6), TYPE (2)`
- Destination first so you know if it's for you or not (unless you're in promiscuous modes)
- Ethernet can go over any physical thing
- Broadcast address is all 1s: all `f`s or 256
- `ARP`/`RARP` (reverse)
  - `PHY ADDR (6) (DST, SRC), LOG ADDR (4) (DST, SRC), OPCODE`
    - `PHY` - MAC
    - `LOG` - IP
  - Only fill in 3 fields
  - `ARP` poinsoning - continually send out packets
    - Tell victim that you're the gateway
    - Tell gateway that you're the victim
    - Avoid this by only listening to the DHCP port (or set it manually if no DHCP
  - `arp -a`/`ip neigh(bor)`

### 3 - Network
#### IP, IPv6 [PACKET]
- IP Packet
  - Header: `SRC IP, DST IP, TTL, Length, Frag, Proto, Checksum, Header Length`
    - `Frag`: Fragmentation
    - `Proto`: Protocal tells you whether it's ICMP, TCP, etc.
    - `Header Length`: You multiply it by 4 (which is why it needs to be in multiples of 4)
      - IPv4 header must be at least 20 bytes, can be more in multiples of 4, adding on additional options fields
    - `TTL`: different for every operating system
- `traceroute`
  - Windows: ICMP `echo` request
  - Mac: UDP
  - Linux: TCP
- `ICMP`
  - Used for error reporting
  - Has no port, since ports are used to tell what process to send it to. ICMP just gets sent to the kernel.

### 4 - Transport
#### ICMP, TCP, UDP
- TCP Packet
  - `SYN`, `SYN/ACK`, `ACK` (could also be `SYN`, `SYN`, `ACK`, `ACK`)
  - Other flags: `RST` clear this from your connection table, `FIN` at the end of the whole session to stop, `URG` urgent, `PSH` sending unrequested data
- Header: `Length, Checksum, DST Port, SRC Port, Seq number, Flags` (not in that order)
  - `Checksum` is a bit operation that has more collisions than a hash. Very fast to do on hardware

### 5 - Session
#### RPC, NetBIOS

### 6 - Presentation
#### TLS/SSL [SSL = TLSv1]

### 7 - Application
#### HTTP

## Protcols
### DNS
- [Explaining DNS](https://www.reddit.com/r/netsecstudents/comments/axje4o/do_you_know_any_good_bookarticleother_resource/)
- [DNS Cheatsheet](https://chrisachard.com/cheatsheets/dns-cheatsheet.pdf)

#### `dig` - a DNS tool

General Use

```console
→ dig alex-bellon.com
; <<>> DiG 9.14.6 <<>> alex-bellon.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64475
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;alex-bellon.com.		IN	A

;; ANSWER SECTION:
alex-bellon.com.	3600	IN	A	216.239.32.21
alex-bellon.com.	3600	IN	A	216.239.36.21
alex-bellon.com.	3600	IN	A	216.239.34.21
alex-bellon.com.	3600	IN	A	216.239.38.21

;; Query time: 28 msec
;; SERVER: 128.83.185.41#53(128.83.185.41)
;; WHEN: Tue Nov 12 17:51:32 CST 2019
;; MSG SIZE  rcvd: 108
```

Shorter Answer
```console
→ dig +short alex-bellon.com
216.239.36.21
216.239.38.21
216.239.32.21
216.239.34.21
```

Nameserver Details
```console
→ dig ns +short alex-bellon.com
ns-cloud-a1.googledomains.com.
ns-cloud-a3.googledomains.com.
ns-cloud-a4.googledomains.com.
ns-cloud-a2.googledomains.com.
```

Use a different DNS server
```console
→ dig alex-bellon.com @1.1.1.1
```

Reverse DNS Lookup
```console
→ dig -x 8.8.8.8
```

[Source](https://mrkaran.dev/posts/dig-overview/)

### HTTP
- [HTTP Guide for Developers](https://charemza.name/blog/posts/abstractions/http/http-guide-for-developers/)
- [HTTP headers you didn't expect](https://frenxi.com/http-headers-you-dont-expect/)

### TCP/UDP
- [List of TCP/UDP Ports](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
- [Closed vs Filtered Ports](http://www.madhur.co.in/blog/2011/09/18/filteredclosed.html)

## Reverse Proxy
- [Self-Hosted Reverse Proxy with Docker and Nginx](https://medium.com/@discite/self-hosted-docker-and-nginx-1dcf2a51b083), [source](https://www.reddit.com/r/selfhosted/comments/f1o546/using_a_cheap_vps_to_install_docker_and_nginx_for/)

## Tools
- [Awesome-WAF](https://github.com/0xInfection/Awesome-WAF) - Everything awesome about web-application firewalls (WAF)
- [brim](https://github.com/brimsec/brim) - Desktop application to efficiently search large packet captures and Zeek logs.
- [broxy](https://github.com/rhaidiz/broxy) - An HTTP/HTTPS intercept proxy written in Go.
- [`iprepd`](https://github.com/mozilla-services/iprepd) - Centralized IP reputation daemon
- `iptables`
  - [RedHat Guide to `iptables`](https://www.redhat.com/sysadmin/iptables)
  - look in `ccdc/firewalls/iptables.md`
- [ngrok](https://ngrok.com/) - ngrok is a reverse proxy that creates a secure tunnel from a public endpoint to a locally running web service. ngrok captures and analyzes all traffic over the tunnel for later inspection and replay.
- [opensnitch](https://github.com/evilsocket/opensnitch) - host-based application firewall
- [ptunnel](https://github.com/izderadicka/ptunnel) - tunnel connections through HTTPS proxy
- [ptunnel-ng](https://github.com/lnslbrty/ptunnel-ng) - Tunnel TCP connections through ICMP
- [SSL Configuration Generator](https://ssl-config.mozilla.org/)

## Resources
- [The IXP Database](https://ixpdb.euro-ix.net/en/)
- [Internet Exchange Map](https://www.internetexchangemap.com/)

## VPN
### VPN Tunneling
- [ZeroTier](https://www.zerotier.com/download/)
  - ZeroTier allows you to directly connect from your machine to another remote machine on another network, and it "punches through" firewalls, NATs, etc. to make a direct connection. You are given a 10 digit `ZeroTier address` for your node, and in order to connect to other networks you need its corresponding 16 digit `network ID`. This allows you to create mesh networks across a bunch of machines and networks.
  - [ZeroTier Linux GUI](https://github.com/tralph3/ZeroTier-GUI)
