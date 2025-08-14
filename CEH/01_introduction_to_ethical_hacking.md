### Motives, goals and objectives on information security attacks
Attackers have motives for carrying out their attacks, some of the motives may include:
1. Information theft
2. Clout.
3. Disrupt business continuity 
4. Ask for ransom.
Remember
Attacks = Motive + Method + Vulnerability

### Types of attacks
Attacks can be classified into five distinct categories, they include:
1. Active attacks
2. Passive attacks
3. Close-in attacks
4. Distribution attacks
5. Insider attacks

#### Active attacks
Active attacks are attacks that are easily detectable and more aggressive in nature, an example of some of the attacks may include:
1. MiTM attacks.
2. Password cracking.
3. Session hijacking.
#### Passive attacks
Passive attacks are attacks that are hard to detect and does not include any disruption or interference with data, some passive attack vectors include:
1. Footprinting.
2. Packet sniffing.
#### Close-in attacks
Close-in attacks are attacks that requires the threat actor to be close to the target some of the attack vectors include:
1. Shoulder surfing
2. Dumpster diving
#### Insider attacks
These are attacks that are performed by people who know the victims such as a disgruntled employee. In my opinion, insider attacks can be a summation of every other category.
#### Distribution attacks
This attack category focuses on products that have not been used by the victim and an attacker can have malware running on it.

### Warfare
Martin Libicki divides information warfare into many categories some of which include:
1. cyber warfare.
2. economic warfare.
3. C2 warfare.
4. Psychological warfare
### Cyber kill chain
The cyberkill chain is an attack methodology that aims to gives insights into an attackers MO, common TTPs and Indicators of Compromise (IoC).

The cyber kill chain methodology is broken down to seven steps
1. Reconnaissance.
2. Weaponization.
3. Delivery
4. Installation
5. Exploitation
6. Command and Control
7. Action on objectives
### Tactics, Techniques and Procedures (TTPs)
TTPs are basically a summary of how an attacker operates on a technical, non-technical and operational point of view.

Tactics: This explains the how the Threat Actor works from a non-technical point of view, this covers mostly the stages such as reconnaissance and ex filtration. Tactics is more related to steps.
Techniques: This talks about the technical actions of the attacker takes in the different stages, this tends to answer the technical question of how.
Procedures: This answers the organizational questions like during recon what exactly is meant to happen.
### Adversary Behavioral Identification
This is the identification of common methods on how adveraries operate by looking at common methods. This is done to give security personnel an insight on how to operate and help the to prepare for when this happens. Some of the behaviors include:
1. Use of the CLI.
2. Use of Powershell.
3. Internal reconnaissance.
4. Command and Control.
### Indicators of Compromise (IoC)
Indicators of Compromise (IoC) is forensic pieces of information collected for intelligence purposes. IoCs can either be atomic indicators, computed indicators or behavioral indicator. Atomic indicators can be emails, phone numbers these are things that are whole and plain. Computed indicators are things llke hashes and regex they are not found in their plain form. Behavioral indicators have a combination of the two and are usually combined based on some form of logic.
### Categories of indicators of compromise.
There are five known categories of IoCs they include:
1. Email indicators
2. Network indicators
3. Host-based indicators
Other Key IoCs may include:
1. Large HTML sizes.
2. Superhuman web activity.
### Hacking concepts
A hacker is someone who gains access to systems with the intention of destroying and stealing sensitive data.

Hackers can be divided into 9 categories they include:
1. White hat
2. Black hat
3. Gray hat
4. Suicide hackers.
5. State-sponsored hackers.
6. Hacktivists.
7. Script kiddies.
8. Cyber terrorist.
Cyber terrorist is driven by political and religious agenda while hacktivists are driven by political agendas mostly.

There are five phases of ethical hacking they include:
1. Reconnaissance: Attacker tries to get more information about the target, categorized into passive and active. 
2. ~~Enumeration~~ Scanning: This is the second step after recon, involves scanning target network at a deeper level and is what differentiates it from active recon.
3. Gaining initial access: This is where the real hacking is done and the attacker gains access to the system through the ways possible.
4. Maintaining access: This is where an attacker creates a backdoor so that they can easily slip in and out of the network.
5. Clearing tracks: To avoid being detected an attacker will cover their tracks by using methods such as using PS tools, deleting logs or steganography to avoid being detected.
### Introduction to Ethical Hacking.
Ethical hacking is an intricate part of a cyber risk assessment as it assists network and system administrators know some of the risks that face their systems and networks.
System administrators are only able to see what can be seen by the attackers and not so much, for an ethical hacker the system is able to see what is available and discover how to use it to excecute other stages in the ethical hacking phases.
Security only becomes useful to the business if they understand the need of having security in their day-to-day operations for them to request for an engagement. They should also be ready to address any vulnerability they discover on their systems.
#### Onboarding someone for an ethical hacking engagement (VAPT)
1. Talk to the client and discuss the needs to be addressed.
2. Prepare and sign an NDA with the client.
3. Organize an ethical hacking team and prepare the schedule for testing.
4. Conduct the test.
5. Analyze the results of the test and prepare the report.
6. Present the findings to the client.
#### Skills required 
##### Technical skills
1. Understanding of Operating Systems.
2. Understanding of networking concepts.
3. Have some sort of skills in atleast once cybersecurity domain.
4. Know how to launch sophisticated attacks.
##### Non-technical skills
1. Have good work ethic
2. Be adaptable to learn new things.
3. Be acquitted with local laws and legistlations.
### Information Security Controls
To achieve administrative and technical security, one has to ensure that they have the right controls in place. This part talks about:
#### Information Assurance.
This is the action of ensuring that information and information systems meet the requirements of the CIA triad, authenticity and non-repudiation. To ensure Information Assurance we can do the following:
1. Define internal policies.
2. Perform vulnerability assessments.
3. Training and sensitization.
4. Ensuring authentication systems are secure.
#### Defense in Depth
This is a security strategy that employs multiple layers to make it difficult for an attacker to penetrate a system. This also makes it easier for administrator a to develop countermeasures when an incident takes place.
### Risk
This is the level of uncertainity for an event that is likely to happen.
Risk can also be defined as the probability of an event happening and the consequences of an event happening. 
#### Risk level
This is the estimated impact on the network. This is done by the use of a risk matrix and can also be calculated using the following formula
Level of risk = Consequence * Likelihood
Risks can also be categorized as low, medium or high risk and having controls doesnot necessarily eliminate the risk.
#### Risk matrix
This scales the risk occurrence and probability of likelihood along with its consequences and impacts. 

#### Risk management
This is the process of reducing risk to an acceptable level.
##### Phases of a risk management program
1. Risk identification.
2. Risk assessment.
3. Risk Treatment.
4. Risk Tracking.
5. Risk Review.
### Cyber Threat Intelligence
This is the collection of information about adversaries and threat actors so as to be well prepared before an attack happens.
#### Types of threat intelligence
1. Strategic threat intelligence: This is information about an organization's security posture, potential threats and similar information that is delivered to others.
2. Tactical threat intelligence: Information about how threat actors operate and 
3. Technical threat intelligence: This is the technical methods that TAs use.
4. Operational threat intelligence

### Threat modelling.
Threat modelling is a form of risk assessment where a network administrator tends to understand how the application works so as to come up with possible threats. For one to perform threat modelling they need to:
1. Understand the application's objective.
2. Identify security objectives.
3. Decompose the application.
4. Identify threats 
5. Identify vulnerabilities.
### Incident Management
This is the process of identifying, investigating and resolving incidents so as to restore things back to normalcy as soon as possible.
Incident management does not only involve security but also involves the following teams:
1. Human Resources.
2. Legal counsel.
#### Incident Handling & Response.
Incident Handling and Response is the process of handling and containing incidents. IH&R involves the following steps:
1. Preparation
2. Incident Recording and Assignment
3. Incident Triage
4. Notification
5. Containment
6. Evidence gathering and forensic analysis.
7. Eradication
8. Recovery
9. Post-incident activities.

### AI & ML <> cybersecurity
Cybersecurity is the fourth most indurstry on the uptake and adoption of AI and ML. In cybersecurity AI and ML has been used in:
1. Mobile security.
2. Deception security.
3. IoT security
4. Automated security.
We can see AI and ML specifically used in the following fields:
1. Password and credential based logins.
2. Network security threats.
3. Phishing.
4. AI vs AI threats.
