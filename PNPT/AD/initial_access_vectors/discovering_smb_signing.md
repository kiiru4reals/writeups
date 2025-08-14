To discover smb_signing we can use the following ways:
1. nmap: Using the script `smb2-security-mode.nse` 
2. Nessus: Gives you results when you scan a target

### Using nmap 
To check using nmap we can use the following command:

```sh
sudo nmap --script=smb2-security-mode.nse -p 445 <target>
```

Non-requirement makes it possible to perform SMB relay attack
