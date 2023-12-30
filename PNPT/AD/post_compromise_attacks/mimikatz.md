This is a post exploitation tool that is used to view and steal credentials and leverage attacks. Mimikatz takes advantage of credentials stored in memory. 

### Using mimikatz
Once you have mimikatz installed on the server, we need to do the following command

```sh
privilege::debug
```

This allows us to bypass meemory protection measures put in place so as to to dump our credentials.

To dump logon passwords, we get the NTLM hash of the user and other users who have logged in 

```sh
sekurlsa::logonpasswords
```

`wdigest` was a feature that stored credentials in memory using plaintext. This can be leveraged by attackers to obtain credentials in plain text. This is disabled by default but it can be enabled.

 

