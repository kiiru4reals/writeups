How many services are running under port 1000?

We can start this room by running an nmap scan, I prefer running an aggressive scan as it combines several parameters in one scan.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/ports_under_1000.png?raw=true)
What is running on a higher port? 
From the nmap scan performed above we cannot see all the results, so we can attempt doing a service version detection scan to determine the services and versions running on our machines.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/service_version_scan.png?raw=true)
Answer: SSH

What's the CVE you're using against the application?
We can perform a script scan for all popular scripts on our target using the -sC nmap flag. 
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/script_scan.png?raw=true)
From the script scan, we discover that the victim machine has FTP anonymous login vulnerability. 
We can then proceed to enumerate the ports so as to get vulnerabilities
Port 21: FTP
We perform a script scan to check if our victim machine is vulnerable to anonymous login. We find that the machine is vulnerable to anonymous login as shown below.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/ftp_anon_scan.png?raw=true)
Port 80: http
I open the IP address on my browser I land on the Apache homepage, from the script scan done above we can see that there is a robots.txt page. I then navigate to the robots.txt page and discover a disallowed page.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/robots_txt.png?raw=true)
When I navigate to that page, I get a 404.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/disallowed_page.png?raw=true)
I then proceed to do fuzz the website using dirb to see if I can get any other files or directories. Without any fancy flags I am able to discover one new directory.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/dirb_scan.png?raw=true)
When I navigate to the simple directory, I am able to find a page showing a CMS called CMS made Simple. 
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/simple_directory.png?raw=true)
When we look at the page, we are able to discover the version of the CMS
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/cms_made_simple_version.png?raw=true)
With this information we can proceed to exploitdb to discover new exploits
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/cms_made_simple_exploitdb.png?raw=true)
Voila! we are able to find a SQL injection vulnerability for versions under 2.2.10. When we open this page, we are able to get the CVE number which is CVE-2019-9053.

We then copy the exploit to our machine and try to run it we get python3 related errors.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/first_run_of_exploit.png?raw=true)
I then decide to look at the code of the exploit and I look at the parser variable. We are supposed to add flags showing the URL and the word list and correct python related errors. I also changed the shebang above to run from python3. Thank God for the little programming knowledge I have.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/code_for_exploit.png?raw=true)
With this knowledge we can run the exploit again specifying the URL using the -u flag, word list for cracking using -w and --crack respectively.

![image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDJcGcq2UpZQc69B_ZvzTMcSyyZebWE3YlJOnNMfYvTw&s)
I am not able to successfully run the exploit, all is not lost though, I am able to find a username and an incomplete salt and username.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/error_running_script.png?raw=true)
I then attempt to bruteforce the password using hydra on ssh. It is important to remember that ssh in this machine runs on port 2222 and not 22, as is usually the case so remember to factor that in.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/cracked_password_using_hydra.png?raw=true)
What is the password? secret
Where can you login with the details obtained? ssh
I am able to login with the credentials gotten in hydra and opened the user.txt file
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/ssh_login_and_user.txt.png?raw=true)
What's the user flag?
G00d j0b, keep up!

I then navigated to the home directory and found another user whose name is sunbath
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/other_user.png?raw=true)
What is the name of the other user? sunbath

I proceed to list the programs to find what program I can run using sudo.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/sudo-l.png?raw=true)
Mitch can only run vim with sudo privileges we can then leverage vim to escalate our privileges.
What can you leverage to spawn a privileged shell? vim

I am able to leverage vim to get root privilege using the command 
`sudo vim -c "!#/bin/sh"`
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/priv_esc.png?raw=true)
We can now navigate to the root folder to get the flag.
![image](https://github.com/kiiru4reals/writeups/blob/main/simplectf_thm/screenshots/root_flag.png?raw=true)


### The End.