Tooling: hashcat
### Usage (NTLM)
```sh
hashcat -m 5600 <hash_to_be_cracked> <wordlist> 
```
#### Quick hack
Get module for certain hash without looking at everything.
```sh
hashcat --help | grep "hashname"
```

### Usage (NTLMv2)
```sh
hashcat -m 1000 <hash_to_be_cracked> <wordlist>
```

#### Usage (Kerberoasting)
```sh
hashcat -m 13100 <hash_to_be_cracked> <wordlist>
```

