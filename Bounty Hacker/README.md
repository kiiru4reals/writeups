### Introduction
You were boasting on and on about your elite hacker skills in the bar and a few Bounty Hunters decided they'd take you up on claims! Prove your status is more than just a few glasses at the bar. I sense bell peppers & beef in your future! 

### Reconaissance
We can start on running an nmap scan on our target to get the open ports on this machine.

![[writeups/Bounty Hacker/screenshots/nmap_scan.png]]
We can see that we have three open ports that is port 21, 22 and 80. Port 21 allows anonymous FTP login. This means that anyone can be able to FTP to this server using the Anonymous user. We can go ahead and open this IP on a web browser and see what we have.
![[writeups/Bounty Hacker/screenshots/web_page.png]]
We have a web page that has a conversation between Spike, Jet, Ed and Faye.
We can try and login as Anonymous using FTP and see if we shall get anything interesting.
![[writeups/Bounty Hacker/screenshots/anonymous_ftp_login.png]]
We have managed to login and obtain two files from the FTP server. We can now download them and find out what is in those files.
![[locks_txt.png]]
From the `locks.txt` file we can gather some files that look like some form of wordlist. This will be inportant when we have to perform a bruteforce attack on a target.
We can now proceed to look at `task.txt`. When we open it we find a note giving instructions to a certain individual as shown below
![[task_txt.png]]
From the wordlist and the person we got on the note, we can try to perform a bruteforce attack using the wordlist we obtained from the previous file. For this, we can use Hydra to perform the bruteforce attack. To install hydra you can run 
```sh
sudo apt install hydra
```
for debian installations.
We can now run hydra to try and bruteforce SSH and we get the following
![[hydra_ssh_bruteforce.png]]
We can now be able to log in as lin using the password we obtained from the bruteforce.
### Initial access
We are able to SSH into lin using the password we obtained above. Upon logging in, you should be able to get the user flag in the working directory
![[ssh_session.png]]
### Privilege escalation
When we run `sudo -l` we get the following
![[writeups/Bounty Hacker/screenshots/priv_esc.png]]
This means that we can only run `/bin/tar` as a superuser, we can look at GTFO bins to find out how we can break out of the shell that we have.
<b>No screenshots this time</b>
With our shell session, we can now navigate to root and find our root flag.
![[writeups/Bounty Hacker/screenshots/root_flag.png]]

### Conclusion
From this machine, we were able to gain access using the FTP anonymous login which should not be the case in any server as this would lead to exfiltration of data by hackers and threat actors. 
#### Moral of the box
Properly configure and set up your FTP ports, or just close them if you do not need to use them in the first place.
