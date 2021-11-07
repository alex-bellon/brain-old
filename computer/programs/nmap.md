# nmap

## Commands
### Find which hosts are up

```
nmap -sn 192.168.1.0/24
```

- `-sn` Ping scan, disable port scan

### Aggressive scan

```
nmap -v -A scanme.nmap.org
```

- `-v` verbose, use `-vv` for more verbosity
- `-A` enable OS, version detection, script scanning, and traceroute

### Fast port scan

```
nmap -sS -F 192.168.1.0/24
```

- `-sS` send a SYN packet
- `-F` fast mode, scan fewer ports

## Other flags

- `-Pn` no ping
- `oA <file>` sends to output file
- `sS` sends SYN packet
- `sU` UDP
- `sV` version scan
