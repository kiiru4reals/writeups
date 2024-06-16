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
