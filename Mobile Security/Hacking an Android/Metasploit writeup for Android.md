### Prerequisites 
Before you start this lab, you are required to install the following on your Kali Linux machine: 
1. Jarsigner: This is used to sign your android application.
2. Zipalign: This is used to zip your Android application

### Prepare your payload
#### Tool: msfvenom

Create your payload using msfvenom as shown below:
![[create_payload_using_msf_venom.png]]
This is what we have done
`-p`: Specifies the payload/
`LHOST`: Specifies our local internal IP address.
`LPORT`: Specifies the port our Android device will connect to.
`kavaluku.apk`: Specifies the name of our malicious APK.

### Generate SSL key.
To sign our application and generate an SSL certificate for our application we need to use keytool to generate our keys.

![[generate_key_with_keytool.png]]
This is what we have done
`-genkey`: This tells keytool to generate our key.
`-keystore`: This specifies the keystore.
`-alias`: This gives our key a name.
`-keyalg`: This specifies the encryption algorithm.
`-keysize`: This specifies the size of our encryption key.
`-validity`: This specifies how long our key is valid for (in days).
Once we hit Enter, we fill in some details as shown below:

![[output_for_key_generation.png]]
### Sign your backdoor
To do this, we require a tool called `jarsigner`, this tool allows us to sign Java applications as shown below.

![[sign_keys.png]]
This is what this command means:
`-verbose`: This is used to provide a message once we issue this command.
`-sigalg`: This specifies the signature algorithm that we shall use to sign our backdoor.
`-keystore`: This specifies our the key that we created above.
`kavaluku.apk`: Is the name of the APK we created on msfvenom.
`rabbit`: This is the alias of our key.
When we run the command, we get the following results
![[verify_signing_of_application.png]]
The above shows us that we have managed to sign our backdoor.
#### Verifying our signature
To verify our signature we can use `jarsigner` to get the following:
![[verify_signing.png]]

### Metasploit
Start metasploit on your Kali machine by typing the following `msfconsole` 
#### Set the exploit
In this write up, we shall use multi handler as our exploit to do so we run the following:
![[set_exploit.png]]
##### Configure the payload
We then set the payload to `android/meterpreter/reverse_tcp` to resemble the payload that we created earlier. We can also set the local host as shown below and exploit it. 
![[set_payload.png]]
Note: Before you exploit, you are required to have downloaded the APK that you generated using `msfvenom`

![[meterpreter_session.png]]

