## Categorizing documentation
1. Internal documentation: This documentation covers knowlege that should guide an internal team in understanding a product or implementation better.
2. Public documentation: This is documentation meant for the public.
### Objectives
1. Help users and other team members.
2. Reduce support requests and help customers self-serve.
3. Improve communication.
4. Help future development.
### Process documentation
This document resides at the heart of the SDLC. This is internal documentation reserved for developers and other key stakeholders of the team. This describes the intricacies of the development process.
#### Project plans
This document provides a scope of the new project and maps the development process for everyone on the team. 
##### Writing a project plan
###### Establish project scope and metrics.
Define scope to be able to establish how much time, resources and work one needs to be done. Take time to define:
1. What is the project?
2. Measure of success? Metric based? Performance based?
3. What is the purpose of the project?
###### Identify Key project stakeholders
1. Who will the project impact?
2. Who will need to provide input at each step of the project?
3. Who will lead the different aspects of the project?
4. Who will be doing the actual work from each all teams?
###### Outline deliverables
1. Have the project levels defined in a more granular level.
2. Create a list of deliverables that will help us achieve the vision of the project?
Note: These deliverables can be epics that can act as key story points to lay a foundation on key issues.
###### Develop actionable tasks
Make the tasks on Jira specifying what needs to be done, for tasks that need to be broken down to be subtasks, this is the time to do so. 
Once all tasks are broken down, we need to see what can be done in parallel and what task can block other tasks.
Specify the timeframes on the tasks and at this point, we can comfortably define the tentative deadlines.
###### Assign tasks and deadlines
Assign tasks to individuals and set deadlines for each task. 
###### Share the project plan and gather feedback
Conduct a document review with all stakeholders gathering feedback to make adjustments and improvements.
A simple template is shown [here](https://www.atlassian.com/software/confluence/templates/project-plan)
#### Product requirements documentation
This serves as the reference document for people working on a product. This covers the design, development (features and functionality). The audience of this document is both technical and non-technical teams.
To write this document, all participants need to have a shared understanding of the vision and the customer needs to be included in creation of this product. The product owner needs to involve the customers in creation of a new product so as to indeed solve the problems that are being faced. 
We can create a customer interview template that can guide the marketing team on how to conduct this particular interview and get to understand some of the pain points that they are facing. The template can have the following information:
1. Interview metadata: Date of interview, interviewers, customer name, customer contact information, company name.
2. Key takeaways at the top to serve as an exclusive summary.
3. Background information with information about the customer's industry, role and experience with your products.
4. Use cases
5. Observations: Problems, takeaways and opportunities.
Once the interview has been conducted we create the Product Requirement Document with the following content:
1. Project specifics: Participants, Status, Target release date
2. Team goals and business objectives: Should be short and straight to the point.
3. Background and strategic fit: Why are we doing this? What is the big picture?
4. Assumptions and contraints.
5. User stories collected from customer interviews, a user story should have the following information for it to be a user story:
	1. Title
	2. User story description
	3. Priority
	4. Notes
6. User interaction and design: This can be the UI mockups and wireframes that guide user interaction
7. Questions: This section carries the things we need to decide or research on.
8. What is out of scope 
##### Things that we need to watch out for
1. Stale documentation: What happens when we implement a story and get feedback and modify the solution?
2. Lack of participation: How can we have people comment and write more specifications and stories?
##### Things to look at
This document sets a foundation for marketing to be able to do market research, conduct interviews and for developers to understand what problem the customer is facing.

#### Product roadmap
This document explains the vision, direction and tracks the progress of the product for everyone on the team. This document should be managed by the Business Analyst, project management or the CEO.
The product roadmap can be broken down into multiple documents to communicate the vision on a more granular level:
1. A roadmap for development teams: This contains information about customer value, milestones and release dates. This assists the developer to understand the direction the organization seeks to take about the product.
2. A roadmap for executives: This roadmap provides the big picture of the growth and maturity of a roadmap. They lack detail and are not directly related to any tasks.
3. Sales roadmap: This focuses on features and customer benefits, potential customers who may require a feature to give them a glimpse on the growth and maturity of the product. No deadlines to prevent unecessarily pressuring the sales team.
4. External roadmap: This is what is shared to clients, this can be broken down and shared using email campaigns and should be visually appealing and easy to read.
##### The roadmap strategy
The product roadmap needs to be bought by two parties:
1. Senior leadership
2. Agile team
The ideas on the executive road map should be broken down to epics, requirements, user stories and user stories that will be added to the other roadmaps. 
##### Best practices
1. Only include as much detail as necessary for your audience.
2. The short term goals matter as much as long term goals so balance that.
3. Review roadmaps regularly and make changes where necessary.
4. Make sure everyone has access to the roadmap.
5. Stay connected with all stakeholders at all levels to ensure alignment.
#### Request for Comments (RFC) document
This document is what is shared to get async feedback on technical ideas and progress within the development process. This document is responsible for collection of feedback and foster organization-wide collaboration.
#### Technical briefs
A brief specifies who is working on a project and their responsibilities. Technical briefs also have timelines of the project and different review stages.
#### Design system documentation
This document serves as the point of reference of UIs and user experience, this document contains rules and guidelines on sizes, color, layouts and more. Think of it as a brand-kit for software products. 
#### Source code documentation
This contains documentation on the source code which makes it possible for developers to understand code. Source code documentation is meant to explain further what is written as comments.
### Product documentation
The non-technical aspect of technical documentation.
#### Product manuals
These document explains everything functionality related about your products to a user.
#### Repair guides
Serves as a troubleshooting guide to help users solve their problems.
#### API documentation
This document gives an explanation on how to work with your API.
### Writing technical documentation
#### Consider your audience
Understand your audiences and how that is going to affect your writing style.
#### Do your research
Find out what is needed to accomplish the project that you are working on and who the stakeholders are. At this point answer the following questions:
1. What are my goals with this documentation?
2. What do we want it to cover?
3. What information should we include?
4. Is there any existing information we can expand or refer to?
#### Detemine best documentation format
1. Is it markdown?
2. Is it bookstack?
3. Is it Google Docs?
#### Write like you speak
This is the time for a first meeting or an email. For product documentation, it is preferred to write how we can speak and for process documentations we need to be brief and straight to the point.
#### Review documentation
Not just for typos but for the language and diction used to ensure that the intended audiences understand the document.

## Writing documentation
### 3Cs of communication
#### Clarity
- Use simple words and language
- Be clear on who needs to perform an action
- Clearly introduce and explain new terms.
- Aim for one idea per sentence
- Stick to one idea per paragraph.
#### Conciseness
Keep your sentences short, aim for 15-20 words per sentence.
#### Consistency
Use the same terminology thoughout the documentation to ensure a seamless reader experience. For example if we call an action a 'workflow' we should use the term 'workflow' and not a 'pipeline'.

## References
1. [Creating an effective technical documentation](https://developer.mozilla.org/en-US/blog/technical-writing/)
2. [How to write technical documentation](https://www.gitbook.com/blog/how-to-write-technical-documentation-with-examples)
3. [Best practices for writing effective project plans](https://www.atlassian.com/blog/project-management/write-an-effective-project-plan)
4. [Iron triangle project management and agile](https://www.atlassian.com/blog/project-management/write-an-effective-project-plan)
5. [Writing an effective project plan](https://technologyadvice.com/blog/information-technology/project-plan-examples/)
6. [How to create a product requirements document](https://www.atlassian.com/agile/product-management/requirements)
7. [Customer interview report template](https://www.atlassian.com/software/confluence/templates/customer-interview-report)
8. [Writing a Product Requirements Document in 2023](https://www.digitalocean.com/resources/article/product-requirements-document)
9. [Product roadmap guide: What it is and creating one](https://www.atlassian.com/agile/product-management/product-roadmaps)
10. 