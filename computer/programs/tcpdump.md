# tcpdump

## Commands

### Track all UDP traffic initiated by host (useful to track DNS amplification attack)
```shell
tcpdump -i any 'udp && src host 172.31.7.188' -vvnnS
```

### Track DNS traffic that comes on the host
```shell
tcpdump -i any '(udp && port 53 && dst host 172.31.7.188)' -vvnnS
```

### Track TCP SYN packages from host: host tries to make to initiate TCP connection with an external source
```shell
tcpdump -i any '((tcp[tcpflags] == tcp-syn) && src 172.31.7.188)' -vvnnS
```

### Track TCP SYN-ACK packages to host: external resources sent acknowledge about opening TCP connection
```shell
tcpdump -i any '(tcp[13] = 18 and dst host 172.31.7.188)' -vvnnS
```

### Track traffic into Redis and write all packets into pcap file (pcap file can be opened in Wireshark then for analysis)
```shell
tcpdump -i any 'dst port 6379' -vvnnS -w redis.pcap
```

### Track all UDP output traffic except DNS
```shell
tcpdump -i any '(udp and not dst port 53 and src host 172.31.7.188)' -vvnnS
```

### Track all traffic with particular host with writing it into pcap file (pcap file can be opened in Wireshark then for analysis)
```shell
tcpdump -i any 'host 172.31.7.188' -vvnnS -w host-172-31-71-88.pcap
```

### Track all traffic on host except SSH, HTTPS, DNS, RabbitMQ, arp traffic
```shell
tcpdump -i eth0 'not (port 22 or 443 or 53 or 5672) and not arp' -nnvvS
```

## Flags
- `D` – show all interfaces
- `i` - interface
- `nn` – without resolving hostname and ports
- `vv` - verbose output
- `S` - get entire package
