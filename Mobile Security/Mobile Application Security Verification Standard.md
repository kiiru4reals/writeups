This is a standard used to offer a baseline for mobile application security while allowing for the application of defense-in-depth measures. 
### How MASVS is used
1. It offers metrics in which it can be compared by organizations and developers.
2. It is used as guidance on how mobile applications can be tested in accordance to industry standards.
3. It is used as a guide yo perform mobile application penetration testing.
### OWASP mobile top 10 vs MSVS
- OWASP MSVS is more of the compliance standard. OWASP MSVS goes deeper in talking about the vulnerabilities that exist in the application.
### Verification levels
L1- Standard security: These are applications that fullfill the basic best practices for mobile security, some of the bare minimum include: 
	- Code Quality.
	- Secure networking.
	- Handling of sensitive data.
	- Interaction with mobile environment.
L2- Defense-in-depth: MOre advanced security controls are required and a threat model should be present.
R- (Resilience Against Reverse engineering and tampering): Applications should comply and demonstrate resilience against threats such as reverse engineering and tampering.
### Domains of the MSVS
#### Architecture, Design and Threat modeling requirements.
These are processes that are put in place during planning and development and address security in all phases of the SDLC.  Security of all components should be addressed at this stage. This does not map to the Mobile Security Testing Guide since it is a white-box activity.
#### Data storage and privacy requirements.
This is protection of data at rest and insecure data is occurs due to improper encryption techniques. Sensitive data can be found in: APKs, binary files, system logs and App process memory space.
#### Cryptography requirements.
There needs to be use of proven cryptographic algorithms that need to store the data of users confidentially. The analyst should ensure that the keys are not hardcoded, key lengths are inadequate etc.
#### Authentication and session management requirements.
This section details how sessions and accounts are managed. Testing includes verifying enforcement of acceptable form of authentication. To properly address this we need to look at the OWASP WSTG.
#### Network communication requirements
This section enforces on confidentiality of data in transit. Analysts should ensure that traffic is encrypted, certificates are signed by a trusted CA nd the analyst should test for SSL pinning.
#### PLatform interaction requirements.
This ensures that the application uses APIs securely by analyzing app permissions, inspecting potential sources of data leakage and focussing on app-app communication implemented using IPC and deep linking.
#### Code quality
This ensures that coding practices do not lead to vulnerabilites and use of secure third-party dependencies.

#### Resiliency against reverse engineeting
This prevents cases of reverse engineering by obfucscating the code and slow the attacker's activity. These controls should not be a replacement for security controls. The app should ensure the app responds to jail breaking, debugging and memory or data tampering.