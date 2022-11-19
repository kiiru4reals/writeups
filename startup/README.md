### Introduction
**We are Spice Hut,** a new startup company that just made it big! We offer a variety of spices and club sandwiches (in case you get hungry), but that is not why you are here. To be truthful, we aren't sure if our developers know what they are doing and our security concerns are rising. We ask that you perform a thorough penetration test and try to own root. Good luck!
**Side note**
We can try and handle this box as a pentest and consider writing a pen test report when we finish up.
### Recon
We can run a scan using nmap to check for open ports, services running and run common scripts by running an aggressive scan.
![[nmap_agressive_scan.png]]

From our nmap scan we can determine that we havve ports 21, 22 and 80 opens. Nmap also runs a script to determine that one can use anonymous login to authenticate to FTP. 
We also have port 22, which is a bit difficult to mess around with and port 80 which means there is a web page.
#### Enumeration
We can also look at the anonymous FTP login and see if we can get anything interesting.
![[anonymous_ftp_login.png]]
 We have been able to login anonymously using ftp and we can see that we have three items on our working directory. We can download them and open them on our attack machine.
 When we look at the `notice.txt` we get the following note
 ![[notice_file.png]]
 We can gather that we may have a user called Maya and we can look at the important photo that we have.
 ![[important_image.png]]
It looks like it is the 'Among us' meme that Maya is accused of uploading. 


When we navigate to the web page on the browser, we see that we have a web page saying that the web page is under developement. 
![[web_page_index.png]]

We can try and fuzz the directories using dirb to see if there are any hidden directories.
![[fuzzing.png]]
We can see that we have a directory called `files` when we navigate there we get the following 

![[ftp_directory.png]]
When we look at this the content is almost the same as what was in the FTP shares. We can try and upload our reverse shell on the share and see if it will reflect.

![[upload_shell_ftp.png]]

![[uploaded_reverse_shell.png]]

As you can see our files has reflected, we can try and start our netcat listener and see if we will get a shell session.
### Initial access
We can now start our netcat session and listen on port 1234 and click on our uploaded reverse shell.
![[reverse_shell_session.png]]
Voila! We have our reverse shell but as `www-data` We can now navigate on the box and find the secret recipe.

When we navigate to the incidents file we have a `.pcapng` file which can be viewed using Wireshark. We can download it and open it on Wireshark
![[download_pcapng.png]]
Note: You need to open a netcat listener on your attack machine.

We were able to follow the TCP streams from the file we got lennie's password and we were able to log in as lennie using SSH.
![[login_as_lennie.png]]
We can then look around and find the user flag.

### Privilege Escalation
We can navigate to the `scripts/` directory and we see that we have a script called planner which prints some stuff to a txt file called `startup_list.txt`.
![[scripts_directory.png]]

We can modify this list to copy the `/bin/bash` directory to `/tmp/` directory and make it a SUID.
We can now escalate our privileges by running 
```sh
/tmp/bash -p
```

![[escalated_privileges.png]]
We are now root as you can see, this means that we can get our root flag and call it a day.
