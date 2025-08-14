### Reconnaisance
We can start by conducting a basic nmap scan as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/basic_nmap_scan.png?raw=true)

From this we can see that FTP, SSH and HTTP ports are open.

We can then proceed to open the IP address from the browser, we find a page with a message as shown below.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/initial_browser.png?raw=true)
### Enumeration
We are supposed to login to the site using our codename. When we look at the next task, we need to get the name of the user name and when we look at the hint we get the following
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/enumeration_hint.png?raw=true)
This is the point where burp suite comes to the rescue as we can intercept our traffic. We can now fire up our burp suite and intercept some traffic. 
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/inject_letter_on_agent.png?raw=true)

We can change the `User-Agent` to `C` and find out out what happens. 
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/agent_c_file.png?raw=true)
Voila! we get the following page. We can now establish our user's name is what  is shown above and also his password is weak. 
### Gaining access
We now have a user and we have established that the web server has port 21 opened. We can fire up hydra and bruteforce his FTP password. In this case, I shall use rockyou.txt as my wordlist of choice.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/ftp_brute_force.png?raw=true)

We ran the command and found the password, we can try and ftp into the server as chris using our password. Damn Chris has a weak password. 
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/ftp_session.png?raw=true)

We are able to ftp into the server as chris and when we list the files available in the server we get three files. We can download them and open them on our machine. When we open our txt file, we get the following note.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/note_to_j.png?raw=true)
At this point, we can infer that the photos have files have hidden messages to get the messages, we can use stegseek to crack the password of those images and get those images. 
To crack the password, we shall use stegseek which shall give us the password and the hidden message.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/stegseek_results.png?raw=true)
When we open the message we get information about the next user and their password. 
We can then fire up binwalk to extract the file on the `cutie.png` as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/cutie_extraction.png?raw=true)
Binwalk is able to extract some files from the image and stores it in a folder as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/extracted_files.png?raw=true)
When we navigate to the new directory we get a zipped file named `8702.zip`.
At this point we can convert the file to be readable for john. This dumps the hash on my `hash.txt` file.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/zip2john_hash.png?raw=true)
We can then crack the hash using john as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/john_the_ripper_hash_crack.png?raw=true)
We can extract our zipped file and see what is there using the password we found. 
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/extracted_letter_from_zipped_file.png?raw=true)
Looking at this note we can see that we need to send a picture to 'QXJlYTUx' ASAP this looks like base64 which we can decode.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/decode_base64.png?raw=true)
When we decode we get Area51 which is what we got somewhere along the way.
We can now ssh to the server as james using the password we got on the recovered file.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/ssh_session_james.png?raw=true)
and voila! we got our user flag and another image. We can download the image by using the scp command as shown below
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/alien_autopsy_download.png?raw=true)
We can then use the google reverse search feature to find where the photo was used and the title of the news piece covered by fox news.
### Privilege Escalation
Now that we have been able to login and download our loot, we can try and escalate our privileges so as to get the root flag. We can type the command `sudo -l` to see the command we can run as `sudo`. We get that we can run the following commands.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/sudo-l.png?raw=true)
This shows that we can run all commands apart from root. When we google this entry we get the following results
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/priv_esc_google.png?raw=true)
When we look at the exploit-db link we get to see a write up of the exploit and how we can use it to our advantage. We can run the following command to escalate.
![image](https://github.com/kiiru4reals/writeups/blob/main/Agent-sudo/screenshots/priv_esc.png?raw=true)
Yay! We are now root this makes it possible for us to explore and find the root flag and Agent Rs name.

### Conclusion
This was a very easy box and I had fun solving it. The issue that this super secret server faced was not updating their machine which made it vulnerable to this privilege escalation attack vector. 
Lesson learnt: Always update your machine.