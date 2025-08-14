### Penetration Testing Methods
#### Black-box testing
In this scenario an attacker does not have any working information when conducting a penetration test.  An organization provides the tester only with a scope and the application to be tested. This takes a longer time as the tester is required to familiarize themselves with the application on their own before conducting their test. 
#### White-box testing
The organization has furnished the attacker with all the information regarding the application being tested. This information can include and is not limited to:
1. Application's codebase
2. Login credentials
3. Application's [[#Environmental context]] and [[#Architectural context]].
This makes the work of the tester easier as they do not necessarily require to deeply perform any information gathering as the information has been provided. 
#### Grey-box testing.
This is the most common penetration testing methodology as it leverages on both worlds, in most cases a tester is given credentials that they can use to login and perform their tests. Other information that may be provided is application source code and other applications.
### Analyzing a mobile application
#### Static analysis
This is used to analyze the application's source code without running it on an emulator or a mobile device. This method can produce false positives and should not be fully trusted without execution. An wxample would be injection attacks, it may not be possible to do CSRF if this is detected on a SAST dcan for a mobile device, this is because the mobile application may not store any cookie information on the browser(if the application utilized web-views.) Other false positives may occur as a result of not understanding the environmental context of an application. This can be hybrid but the manual part requires the tester to have a good grasp of the programming language or framework in use.
#### Dynamic analysis
This mode of analysis is used to detect vulnerabilities as the application is running or being executed with the happy and alternate path in mind. THe results of this application is more accurate and may take a hybrid approach so as to tackle issues around business logic.
### Phases of Mobile Application Security Test
> Mnemonic: PIMER(Preparation, Intelligence gathering, Mapping the application, Exploitation, Reporting.)

#### Preparation
This step involves laying down the foundations, setting up the environment, scoping, preparation of the rules of engagement for the test. This step involves collaboration with the business. The organization is required to provide a copy of the APKs they want to be tested. It is recommended that the artifacts provided should be a debug copy and a production copy so as to ensure that measures enforced in development work in production. The other reason could be to bypass SSL pinning and make it possible to proxy data. Finally, the security context of the application is acquired at this stage.
#### Intelligence gathering
This step involves understanding the enviromental and architectural context of the application to make you understand how the application works.
##### Environmental context
The factors to be considered in this section include the following:
1. Goal of the application: What problem does this application solve. This should give you an insight of the functionalities users may use in the application. The goal of a dating app may be used to meet new people with the intent of having a romantic relationship with them.
2. Stakeholders and investors: Who built this application, who has invested in this application may provide insights on how much they invest into their application's security.
3. The industry: To consider what could be a high, low and medium risk finding
4. Internal processes: This makes it easier to look out for business logic flaws.
##### Architectural context
1. Communication between the application and the backend servers to find out if security is implemented when communiacation is done.
2. Storage: How does the application store data locally, how and where is sensitive data stored? 
3. The Operating System in which the application is meant to run on.
4. Remote services the application connects to.
#### Mapping the application
This step entails understanding the design of the application. This allows you to see what security considerations have been put into place by the developers of the application. This can also involve use of threat models. Other methods would be analyzing the application's source code and performing SAST and DAST to discover vulnerabilities.
#### Exploitation
This step involves exploring vulnerabilities discovered in the last stage.
#### Reporting
The final step that involves writing reports that will be shared to the organization and other stakeholders.
### Testing in SDLC
In a waterfall enviroment, testing often came at the end, as it requires that once the steps are completed there is no going back, this made security an afterthought. Security was also more of a network admin function which was used as an excuse for not covering security in applications but with the growth of applications and its application on mobile phones, browsers and IoT more needed to be done.
For security in DevSecOps look at the below articles
1. [[SAST for mobile]]
2. [[03. Pre-commit hooks]]
3. [[02. PASTA Threat modelling methodology]]