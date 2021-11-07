# Zeek
- Open Source network security monitoring framework
- Parses traffic from a PCAP or live from interface
- Has dozens of protocol parsers

## Tools
- [brim](https://github.com/brimsec/brim) - Desktop application to efficiently search large packet captures and Zeek logs.

## Zeek Data
- Just text log files
    - `conn.log`
      - Has columns of protocols, length, MAC addresses, etc.
    - `http.log`
    - `dns.log`
  - There's a tool called `zeek-cut` which makes parsing a lot easier
