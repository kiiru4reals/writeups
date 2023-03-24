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
![[Pasted image 20230324201851.png]]
We can then do the same scan but add a `-Pn` flag, what this flag does is that it assumes that the host is online.

When we visit the IP address on the browser we are redirected to the following web address
![[unreachable_site.png]]
To view this site, we can add the domain to our `/etc/hosts` file when we reload the browser we shaall get the following
![[ssl_warning.png]]
We can then scroll through Thomas' website and get his phone number at the bottom of the web page.
From our port scan we were able to establish that port 10,000 runs Miniserv 1.890 (Webmin httpd), we can google this to get possible exploits 
![[duckuckgo_results.png]]
From the above search we get possible exploits that we can use.