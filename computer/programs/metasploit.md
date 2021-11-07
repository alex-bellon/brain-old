# Metasploit

## Common Exploits
- `ms08_067`
- `ms17_010` - Eternal Blue

*`ms<yr>_<version>` are the Microsoft identifiers*

## Getting Shells
- Scan the network for accessible hosts
  - **ARP Sweep**
    - Try to ask for MAC addresses for a certain IP
    - Need to be on the same network
    - Firewalls won't notice it
    - Needs to know what interface to send out from
  - **IPv6 Multicast ping**
- Scan accessible hosts for open ports
  - TCP Port scan
- Profile services to identify vendors, products, version
  - Metasploit modules for SSL, SSH, SMB, etc.

## Metasploit Flow

0. `use <module>`
1. `show options`
2. `set <variables>`
3. `run`
4. ???
5. Profit

## Eternal Blue

### Steps of Exploitation
- Get connection to the host and send the exploit
- Optional NOP sled
- Optional stager(s)
  - Manipulate memory to support our payload
- Encoded payload
  - Meterpreter
    - Modular payload

### Post Exploitation
- Command Shell
  - Can upgrade to Meterpreter
- Meterpreter
  - Go straight to Meterpreter
  - Use `set PAYLOAD` in Eternal Blue module
