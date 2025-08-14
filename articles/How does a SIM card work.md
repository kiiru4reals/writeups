Subscriber Identity Module (SIM), the common denominator in the evolution of mobile computing. The SIM card has arguably retained its importance and has continously adapted to its application from the advent of mobile phones, modems and currently IoT. The SIM card is a small device that runs on at most 1MB of storage and memory. This 1 MB is divided into RAM of about 256 KBs and the rest is Electronically Erasable Programmable Read Only Memory (EEPROM). 
### The SIM card file structure
The file structure of a SIM card is divided into three main categories:
1. Master file: This holds the root directory of the file system.
2. Dedicated file: This holds the sub-directories of directories in the master file.
3. Elementary file: This holds information that relates to the subscriber.
### What information is stored on a SIM card
The SIM card does not have a humongous amount of storage to store data as compared to your mobile phone's storage, the sim card stores the following information:
1. Contacts (these contacts are selected by the user, frequently dialed contacts and last number dialed, numbers on hot dial?)
2. Country Code: Upto three digit codes that identify your country.
3. SMS messages: These are messages that are sent and recieved by a subscriber where the telco works as an intermediary.
4. Mobile Network code (MNC): This is a code that is used by the SIM card to identify the Service Provider, every Service Provider bears a unique code. 
5. Mobile Station INternation Subscriber Directory Number (MSISDN): This is a fancy name for your phone number
6. Integrated Circuit Card ID: This is a combination of digits that are unique to your SIM card. These digits range from 19-20 and may vary based on the service provider. The composition of the combinations are broken down below:
	1. Indurstry code: This is a code that is unique to an industry in which the SIM card is purposed for, for your SIM card it should be 89 as this is used by telecommunication companies.
	2. Country code 
	3. Mobile Network Code
	4. A unique set of combination that is unique for your number.
	In some cases the ICC ID may have an extra digit at the end that is used to validate the inegrity of the the ICCID number. The ICC ID is locally referred to as the serial number.
### How does authentication take place in a SIM card
When we insert a SIM card to a handset, we are required to enter a PIN (this is where a red branded telco leaves the group), this PIN is then shared to the telco for verification. The telco then responds with an encrypted response that is shared with the SIM card. The SIM card then decrypts this response and shares the response with the telco. If the SIM response is the same as the Telco request, the SIM card unlocks successfuly and the subscriber can use it. In the case where the code is not the same, the SIM card informs the user that they entered the wrong PIN. When a user enters a wrong password three times the SIM card is locked and required a Pin Unblocking Key (PUK) to unlock the SIM card.
### Authorization in a SIM card
The SIM card classifies information into three categories that are used to control access of information on a SIM card. They include the following:
1. Always: This can be accessed by anyone who interacts with the handset.
2. Card Holder Verification 1 (CHV1): Access to data stored with this permission requirement requires authorization by entering PIN 1. 
3. CHV2: Access to data stored with this permission requires the subscriber to use PIN 2.
4. Administrative: This data can be accessed by users with administrative access to the SIM card. This could be the Service Provider.
5. Never: This data should not be accessed by anyone.