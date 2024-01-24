### Introduction
_Out of the blue, an old friend from university: Thomas Wreath, calls you after several years of no contact. You spend a few minutes catching up before he reveals the real reason he called:_

> **_"So I heard you got into hacking? That's awesome! I have a few servers set up on my home network for my projects, I was wondering if you might like to assess them?"_**

_You take a moment to think about it, before deciding to accept the job -- it's for a friend after all._

_Turning down his offer of payment, you tell him: I'll do it!

Thomas then sends over information over a network which includes the following:
<i>There are two machines on my home network that host projects and stuff I'm working on in my own time -- one of them has a webserver that's port forwarded, so that's your way in if you can find a vulnerability! It's serving a website that's pushed to my git server from my own PC for version control, then cloned to the public facing server. See if you can get into these! My own PC is also on that network, but I doubt you'll be able to get into that as it has protections turned on, doesn't run anything vulnerable, and can't be accessed by the public-facing section of the network. Well, I say PC -- it's technically a repurposed server because I had a spare license lying around, but same difference.</i>

From the following we can assume the following:
1. There are three endpoints on the network.
2. The web server faces the public by portforwarding the address from his home network.
3. There is a self hosted git server.
4. There is a PC which is his.
5. His PC runs an anti-virus and can't be accessed from a public facing network.

### Enumeration
We can start by performing an nmap scan on the target to get the first 15000 ports, the operating system and probably output the results in a file as this is a long time assignment. We can start nmap but we get that the IP address cannot be pinged from the internet as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/nmap_scan.png?raw=true)

We can then do the same scan but add a `-Pn` flag, what this flag does is that it assumes that the host is online.

When we visit the IP address on the browser we are redirected to the following web address

![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/unreachable_site.png?raw=true)

To view this site, we can add the domain to our `/etc/hosts` file when we reload the browser we shaall get the following

![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/ssl_warning.png?raw=true)

We can then scroll through Thomas' website and get his phone number at the bottom of the web page.
From our port scan we were able to establish that port 10,000 runs Miniserv 1.890 (Webmin httpd), we can google this to get possible exploits 
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/duckduckgo_results.png?raw=true)

From the above search we get possible exploits that we can use.
### Exploitation: Exploiting public facing application
We can use the RCE that we found during the enumeration stage. We can use the version written by [Muirland Oracle](https://github.com/MuirlandOracle/CVE-2019-15107) in this case. Once you clone the repository we can install the requirements using 
```sh
pip install -r requirements.txt
```
 and make the script executable by using the following command:
```sh
sudo chmod +x ./file_name.py
```
When we run the python script we get the following:
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/initial_access.png?raw=true)

Voila! We got a reverse shell on the target server. We can then answer the questions on the room and try obtain a reverse shell by typing `shell` on the terminal session. We then need to enter our machine's IP address and desired port (I chose 1234) and I spawned a netcat listener on another terminal.
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/reverse_shell.png?raw=true)

Now that we have a permanent shell we can then proceed to look for the root password hash in the shadow file as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/root_user_hash.png?raw=true)

We can then proceed to get the private SSH key for the server so as to be able to maintain our access. 
![image](https://github.com/kiiru4reals/writeups/blob/main/wreath/screenshots/ssh_private_key.png?raw=true)

