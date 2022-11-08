We can start by performing a nmap agressive scan to see open portsm service version and OS detection.
From the scan, we get that open ports are 22 and 80.
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/nmap_scan.png?raw=true)


When we visit port 80, we get the Apache default page as shown below.
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/default_page_port_80.png?raw=true)

We can then try and fuzz the webpage using dirb to find out if there are any hidden directories. We get the following results.
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/directory_fuzzing.png?raw=true)
When we visit the `content` directory we get the following
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/content_root_page.png?raw=true)

We can see that the directory runs a CMS known as SweetRice. You can google and find out more about SweetRice. 
When we visit the `content/as` directory we get the following login page.
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/login_page.png?raw=true)
When I was researching on what SweetRice was, I stubled upon default credentials used by SweetRice for fist time users. I tried them and voila!
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/home_page.png?raw=true)
we get the homepage :)
When we access the settings we can see the database details as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/db_creds.png?raw=true)

When we look at the ads page, we can see a place where we can write our ads (I'd like to believe that is the purpose of the text box.) We can write a PHP reverse shell or download one from this [github repository](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php)
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/ads_page.png?raw=true)
We can now start our netcat listener and have it listen on port 1234 by typing 
```sh
nc -lnvp 1234
```
We can then proceed to initialising the PHP script by clicking on it at `http://<machine_ip>/content/inc/ads` 
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/nc_intial_access.png?raw=true)
We can try escalate our privileges using `sudo -l` we get the following
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/priv_escalation.png?raw=true)
When we navigate to the `backup.pl` file and we can see that it allows us to run a shell script which allows us to escalate our privilege. We then excecute it and we get a root session
![image](https://github.com/kiiru4reals/writeups/blob/main/LazyAdmin/screenshots/root_access.png?raw=true)
We can navigate to the root folder and obtain the root flag.

### Conclusion
From the above machine, we can see that this CMS was poorly configured as I was able to get the user login credentials from a Google search. 
From the version, it was also possible to get possible vulnerabilities and exploits from the exploit database or spawn a PHP reverse shell. 
To remedy this, we can ensure that we use latest versions with necessary patches and avoid using default credentials.

### Bonus
As I was browsing the CMS I was able to get a database backup as attached in my Github Artifacts folder.