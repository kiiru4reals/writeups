### Keeping users logged in
Whenever users login to modern sites, they are given a chance to be 'remembered' by clicking a checkbox that follows. At this point a cookie is generated and stored on the browser. This cookie can be retrieved using an attack such as XSS and used to decipher username and password of the victim. Developers may sometimes use Base64 to encode this cookie or a one-way hash without any salt in place which can be reversed by an attacker to retireve the compromised details stored in the cookie. 

Try decipher the remember_me cookie below

```txt
d2llbmVyOjUxZGMzMGRkYzQ3M2Q0M2E2MDExZTllYmJhNmNhNzcw
```


### Storage of passwords in plain text
Web applications that happens to handle passwords correctly should not send passwords to email, as this attack method can be susceptible to MITM attacks. If passwords have to be shared on email they should be reset within a short time but this practice is highly discouraged.
