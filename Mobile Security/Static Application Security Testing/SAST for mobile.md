To perform this lab we need to install the following:
1. Mobsf: Mobile Security Framework.

### Installation
We can clone mobsf from Github by running the following command
```sh
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF
```
Once we clone the application, we can setup using the script provided for us by running the following command
```sh
./setup.sh
```
We can then run the application by running the following:
```
./run.sh
```
Once we do this, we can access the application on our browser by entering the following address on the browser
```txt
http://localhost:8000
```
At this point, we can upload the application as shown below
![[Pasted image 20231208090224.png]]
### Information section
Once the analysis is complete you will be redirected to the following page
![[Pasted image 20231208090309.png]]
At the top, you can see the application information, the security score and other information related to the application.
#### Statistics
On this section, you are able to see a summary of the whole report in numbers as shown below
![[Pasted image 20231208090507.png]]
### Scan options and Decompiled code
On the below screenshot, we have the option to start our Dynamic Analysis or conduct another Static Analysis. We are also able to view the Decompiled code by downloading the Java code or smali.
![[Pasted image 20231208090631.png]]

#### Signer certificate
We are able to view our application's certificate as shown below, this is what the application uses to facilitate secure communication to the server.
![[Pasted image 20231208090944.png]]
### Application permissions
We are able to use application permissions, to show the permissions that the application uses.
![[Pasted image 20231208091654.png]]

### Android API
At this point, we can see the APIs that are related to our Android applications, in our case we are not able to see so much as this application is heavily obfuscated so we cannot see anything substantial.
![[Pasted image 20231208092304.png]]
### Browsable Activities
We can see activities that run on the application, we can see that the application uses the following services
![[Pasted image 20231208092800.png]]
### Security analysis
The security analysis section is divided into four parts:
1. Network security.
2. Certificate analysis.
3. Manifest analysis.
4. Code analysis.
5. Binary analysis.
6. NIAP analysis.
7. File analysis.
### Malware analysis
#### Server locations
We are able to see the locations where our servers are stored as shown below
![[Pasted image 20231208093643.png]]

### Others 
Other interesting data from this report include:
1. Hardcoded secrets.
2. Trackers.
3. Email addresses.