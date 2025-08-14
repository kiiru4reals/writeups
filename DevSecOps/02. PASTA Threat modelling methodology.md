The Process for Attack Simulation and Threat Analysis (PASTA) is a comprehensive threat modelling methodology designed to assess both business and technical risks. It ensures that your application, network, or general technology solution is developed with a full understanding of the various cyber risks your business may face. The methodology is divided into seven phases, which can be abbreviated as D3(Cubed)AVAR which in full stands for:
1. Definition of objectives
2. Define the technical scope
3. Decompose application components
4. Analyze threats
5. Analyze vulnerabilities
6. Analyze attack methodologies
7. Analyze risks and business impact

To illustrate PASTA, let's consider a banking application, ensuring that both non-technical readers and technical experts gain value from this explanation.
### Definition of Objectives

In this phase, the business development team defines the customer-facing goals of the application, such as:

- Enabling deposits from mobile wallets.
- Allowing money transfers between accounts and mobile wallets.
- Supporting loan requests via mobile wallets.
- Applying for debit/credit cards through the app.

Next, the project manager collaborates with the lead developer to translate these business objectives into technical goals, such as:

- Developing the app using Flutter for cross-platform functionality.
- Utilizing a GraphQL endpoint for efficient API communication.
- Storing data in a PostgreSQL database.
- Hosting the API on an Nginx server via Amazon AWS.

Lastly, the application security team sets security-related objectives, such as ensuring PCI-DSS compliance, implementing secure authentication/authorization, and establishing secure communication between the app and supporting services.
The combination of these objectives drives the app’s development, ensuring alignment between functionality, security, and business goals.
### Define the Technical Scope
From the objectives, we identify the technologies the app will rely on:
- **Flutter** for development.
- **GraphQL** for API interactions.
- **Nginx** as the web server.
- **Amazon AWS** for cloud hosting.
- **Android and iOS** as mobile platforms.
Defining scope also includes excluding certain areas from the assessment, such as container technologies, server OS settings, and container orchestration configurations. This scoping ensures a focused threat model.
### Decomposition of the Application
We have now understood the services that will be used to develop and run this application. We can then create data flow diagrams showing trust boundaries, actors, data stores and the movement of data within the Eco-system. We are also able to have a list of assets which prepares us for the next step in the threat modelling process.
### Threat Analysis
With the application decomposed, we can now identify potential threats to its assets, using sources like threat intelligence reports and industry-specific attack data. Contextualizing these threats enables the development and business teams to understand the risks in detail, avoiding generalized fears.
### Vulnerability Analysis
At this stage, we ask key questions:
- What could go wrong with the application?
- What flaws exist in its design?
- How can we prevent vulnerabilities?
These questions guide our analysis using design documents and DFDs developed in earlier stages, helping us correlate threats to security weaknesses. Vulnerabilities are scored using systems like the Common Vulnerability Scoring System (CVSS).
### Attack Analysis
Now that we have our threats and vulnerabilities defined, we can now test them and assess the viability. This can be performed using attack trees, attack trees allow us to map the threat actor's objectives using the attack vectors that can be exploited through the vulnerabilities derived from stage 5.
#### Attack Trees
Attack trees are blueprints that detail objectives and possible methodologies a threat actor can use to exploit vulnerabilities in a system. Attack trees can be used in the threat modelling process to understand the magnitude of risk that your product faces. Attack trees also server as a basis of discussion and gives a non-technical understanding of attack methods used by a threat actor. Attack trees are hierarchical in nature and have a parent node that outlines the objective of an attacker and branches that show a general version of how. The next step can be granular and outline the different attack vectors that can be used by an attacker to achieve their objective.

The result of this phase is an overview of the application’s attack surface, complete with possible attack paths.

### 7. Risk and Impact Analysis

Finally, we assess the risks the application faces based on the previous stages. This phase equips stakeholders—both technical and non-technical—to make informed decisions on risk reduction and to evaluate the impact of potential threats. We develop an application risk profile, identify residual risks, and create a risk mitigation strategy.
### Conclusion
The PASTA methodology not only strengthens an application's security but also delivers significant business value by aligning cybersecurity with core business objectives. In an era where cyber threats can lead to financial losses, legal penalties, and reputational damage, integrating security into the development process ensures that risks are addressed proactively. This approach enhances customer trust, ensures compliance with regulations, and protects critical assets, ultimately fostering business resilience and enabling growth while minimizing the risks associated with cyber threats.