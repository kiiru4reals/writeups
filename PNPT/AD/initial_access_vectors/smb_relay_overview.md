### Tooling
1. NTLMrelayx
2. Responder
### Definition
Instead of cracking hashes, we can push them to another machine to achieve this one needs to disable SMB signing and relayed user credentials must be admin on the target machine. 
We have to relay the hashes to other machines and the victim HAS to be admin and have SMB signing disabled.

#### Configuring responder
To get started, we have to ensure that responder configurations read as follows:

```txt
SMB= Off
HTTP = Off
```
This configurations can be changed at `/usr/share/responder/responder.conf` or `/etc/responder/Responder.conf`  

### Configuring ntlmrelayx
This tool is responsible for performing SMB relaying and takes the target and the victim IP addresses.
#### Usage
```sh
python ntlmrelayx.py -tf targets.txt -smb2support
```
