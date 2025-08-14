- The Software Assurance Maturity Model makes it easy for organizations to analyze their current application security posture and build a program with well defined security iterations.
- To be able to translate cyber security needs to business requirements, we can group our cyber security milestones in five business functions that have some software development functions.
- These five groups are divided into three levels which form the software assurance levels which are then divided into two streams which provide the deliverable for each level.
- Once we have the five groups, we are able to have the following:
	- Assess the organization's current security posture.
	- Define the organization's target.
	- Develop a roadmap to implement security requirements.
	- Get recommendations on how to implement particular activities.
- The five groups include the following:
	- Governance
	- Design
	- Implementation
	- Verification
	- Operations
## Governance
- This is what I would like to call the GRC of application security. This function covers the procedures and processes put into place to manage software development activities. 
- This function covers all activities involved in the development phase and may have a significant organizational effects.
### Practices and overview
#### Strategy & metrics
- This level focuses on the processes and procedures set in the software development process.
- This level seeks to create a roadmap and set goals of what you envision your application security program to be like.
- This allows the organization to measure how far it has come in adopting application security practices.
- The two streams in this level include:
##### Create & Promote
- This stream creates an application security roadmap to set the organization's objectives and to align other business units.
- The first step is to understand what threats exist in the present and future and the tolerance level of the executive towards the threats. The risk profile should form a baseline and a set of priorities that the organization needs to focus on and shared to stakeholders for transparency.
- The second step is to develop a roadmap that will serve as a long-term strategy. The best way to develop this roadmap is to categorize the goals based on financial expenditure, change of standard operating procedures and culture change (this order is highly encouraged.) Once you have this particular roadmap, we need to have the buy-in from the organization's stakeholders and development team and should be available to all stakeholders for future reference.
- Once we have the three steps set up, we need to have these reviewed and have the relevant assignees accountable for the development of all the steps on the roadmap.
##### Measure & Improve
- Document your progress based on three metrics which include Effort to measure the effort spent on security, Results of the security efforts and initiatives, the Environment of where the security takes place in the SDLC. Gathering these metrics should be inexpensive to gather, consistently measured and expressed as a unit of measure.
- Based on the metrics that you collect, we can use them to develop general KPIs which allude to the metrics that you collect for you to be able to effectively track them in a percentage form. This should be shared with the application security and development teams for full transparency.
- Continuously measure and improve on these metrics to ensure that you are always improve and adopting to new trends. These reviews can be done on an annual basis to ensure that your metrics and KPIs are effective and efficient.

#### Policy & compliance
- Application security procedures are also added at this particular point with a clear strategy on how mature this project.
- We also get to define what standards and regulations the application needs to comply to in accordance with 3rd party obligations.
- This step is important to ensure that the measures in place are not out of scope
##### Policy & standards
- Develop security policies for software development that are meant to assist to make you comply to a certain form of legistlation or standard (GDPR, PCI-DSS) etc. These policies should be very high level and not be tool-specific. In cases where there is need to comply to a certain standard, we need to focus on the technology required to implement the security requirements.
- To ensure that application complies to some of the requirements set by standards, we can write test scripts that check if the application meets the technical requirements that are required by your policies. This helps to reinforce what has been documented on the policies. These test scripts should be continuously maintained and modified to cater to the application's evolution and continuous growth.
- Lastly measure the compliance metrics with existing  metrics and standards. This can be done by conducting an assessment that is meant to determine the compliance levels of your application, for non-compliant teams ensure that they are able to access these compliance guidelines and encourage them to comply. In situations where a team is not willing to comply with these guidelines, one should escalate through channels that have been set to the organization.
##### Compliance management
- Now that we have policies set up, we can go ahead and get requirements that need to be gathered to comply to the standards or requirements that have been requested for by clients. The next step is to map these requirements to the policies that you have created, in cases of discrepancies alignments need to be made to ensure that the documents are in tandem. To be able to further understand these requirements, we can use the policies as a point of reference.
- The next step is to ensure that we can have test scripts that specifically check for compliance requirements to legistlations and implement a policy to reassess the compliance requirements of the application. This makes the compliance requirements transparent and possible to demonstrate for QA, security and development teams.
- Lastly develop a program to measure these requirements. This can be done through test automation to ensure that compliance is continously maintained through the different application versions. Test automation is not fully possible in an application for such cases one can conduct an audit, an assessment to determine compliance through manual testing. In cases where there a significant compliance gaps are noticed one needs to touch base with the executives and make a decision to either eliminate the requirement, do a cost-benefit analysis to determine the feasibility of the compliance requirement.
#### Education & Guidance
- This is knowledge sharing on how to build secure applications.
- This can be rolled out through instructor-based sessions or computer-based modules.
##### Training & awareness
- It is important to conduct security training and awareness sessions for all roles involved in the design, development and maintenance of an application. It is recommended to do this training as one-on-one sessions for more engagement and exchange of ideas and use of computer-based modules  in cases where teams are huge. Training can be tailored on the OWASP top 10, MSVS or any other materials that may be fit for your team. It is also important to have the content accessible to non-technical teams should there be need to have them refer to it and the training should also allude to the compliance requirement and other policies that have been set by the organization.
- Training material should be delivered in a targeted manner, so as to ensure team members get to have the required information on how to infuse security in the process. This training can be broken down to focus on business analysts, developers, QA testers, security analysts and project managers. Training material will vary for all these teams apart from security analysts who have to be equipped with every single aspect of training. 
- Lastly there is need to implement a formal training program to train new and current team members on security in the SDLC. This can be done in the on-boarding process and continously through their time at the organization. This program should be managed in-house and consist of materials based on in-house practices and industry best practices. To monitor this, the organization can choose to invest in a learning management platform that requires a team member to complete some of the phases during the on-boarding process and during their time working at this organization.
##### Organization & culture
- Identify a security champion who has dedicated time to perform information security tasks in your team. It is advisable to have a hire who does exactly that but a security champion can be a developer, project manager, QA tester, business analyst. This individual should participate in conducting architectural reviews, risk assessments and threat assessments to remediate security defects and make everyone aware of the problems and remediation efforts put in place.
- Develop standards and coding best practices for security and ensure that these standards are continously evolving to suit the emergence of new technologies, programming languages and frameworks. This is done to ensure that applications conform to security best practices and streamline various aspects of the SDLC. 
- Lastly develop a community that assists team members to be able to learn and share information on emerging trends, new technologies and share solutions to the problems that they have faced. The security team can use this information to also ger insights and get an opportunity to assist other team members on the problems that they may be facing.
## Design
- This step involves the definition of the goals that the application tends to achieve.
- This is where the application security team gets to point out potential vulnerabilities and provide solutions on how to prevent them.
- This step involves the following practices:
	- Threat Assessment
	- Security requirements
	- Security architecture
### Threat Assessment
- This practice involves identifying and understanding project level risks based on the project requirements and the runtime environment.
- The two streams in this level include the following:
	- Application risk profile
	- Threat modelling
#### Application risk profile
- Identify risks in an application using simple methods and demostrate how it will affect the confidentiality, integrity and availability of data. This can be done by asking a set of general questions and categorizing risks through an internal metric or common metrics such as the Common Vulnerability Scoring System(CVSS).
- The next step would be to further breakdown the risk matrix to focus on all your applications as a company and look at the different effects it has on the confidentiality, integrity and availability of information. At this level, it is encouraged to also look at the privacy risks that are involved in the application. Once this is done, the security team proceeds to set up a risk inventory to manage accountability and give all stakeholders a central point of reference.
- The final step would be to continously review the application risk profile and make it adapt to the current business needs. All stakeholders should be able to question the application risk profile and make adjustments where necessary. This leads to better representation of the risk profile.
#### Threat modelling
- Conduct threat modelling exercise to identify high level threats and come up with mitigation strategies. This can be done with the relevant stakeholders in this project such as the project manager and the security champions. This discussions should be very brief and should be very granular as your application grows. This can be done as a table-top exercise.
- Decide on a threat modelling methodology that your organization will use to identify threats and possible mitigations. Threat modelling requires a proper understanding of the environment and how the applications work. These threat models should be updated as the application continues to evolve.  
- The final step is to ensure that your threat modelling is integrated into your SDLC. Threat models should be regularly reviewed and updated in line with the evolution of your application and the lessons that you have learnt. At this level, one can consider to automate bits of threat modelling by embracing threat modelling as code to integrate threat modelling results with your application code.
### Security requirements
- This practice involves defining software security requirements that are focused to protect the data processed by your application and the service at large. This second type deals with the requirements that need to be met by third-party vendors and SaaS providers because of the impact this can have on the security of your application. The third part is to ensure that we have  secure libraries and ensure that it is part of the software supply chain stream.
- The two streams in this level include:
	- Software requirements.
	- Supplier security
#### Software requirements
- The first step would be to perform a review of the functional requirements for your application and add security requirements based on the desired confidentiality, integrity and availability of your application and the data that it processes. These objectives can relate to functionalities and does not necessarily mean new functionality. These requirements should not be very general and should have a relationship to the application at hand.
- The next step is to align security requirements with the application's requirements. These requirements should have a certain structure and can be added as an extension to your user stories, Product Requirement Documents and epics. This ensures that practices are taken into account during the development phase. 
- The last step is to have a requirement elicitation framework that gives clear guidance on the quality of requirements and how to describe them. This empowers the projects team get requirements from the concerned stakeholders efficiently. 
#### Supplier security
- An organization out-sourcing an application is mandated with the responsibility of ensuring that their third-party software providers provide security for their software. This can be done by having a checklist that vets the provider on the different security measures that they have implemented. This assists the provider to align themselves with your organization's risk appetite and you are able to meet the software requirements in that particular area.
- The next step would be to ensure that there is a form of agreement and delegation of responsibilities to the suppliers showing what needs to be done. This can be put in a contract or enshrined in the supplier's SLA showing the roles that need to be done by the supplier. This can slowly evolve into a standard agreement but room for deviation can be provided on a case-by-case basis.
- The last step would be to align your development processes with the third-party provider. This approach ensures that your applications go through a similar build, verification and deployment process. If this cannot be met you are advised to have compensating controls such as implementing additional tools or having another activity such as threat modeling.
### Security architecture
- This stage focuses on securing the different technologies used in the SDLC. This allows the Security champion to be able to decompose all the technologies used and look at the security requirements for each and its implementation.
- The two streams in this practice include the following:
	- Architecture Design: This stream focuses on the requirements that are identified that may help in improving the security posture of the software.
	- Technology management: This focuses on the requirements that need to be implemented to secure the technologies that support the application(s).
#### Architecture Design 
- The first step would include be to identify the software requirements of an application based on an agreed set of principles such as the OWASP top 10. The unit working on this application can add some of the features in a way that it takes very little effort without interfering with their development processes.
- The next step would be to 
#### Technology management