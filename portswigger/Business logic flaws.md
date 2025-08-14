Business logic flaws are vulnerabilities that arise from the implemntation of a certain feature and has to do with the developer's or the system analyst's flow of thinking. These vulnerabilities arise because of how a developer assumes a user is going to interact with the system. 
Lack of having the ability to foresee how a threat actor might interact with this application might lead to high severity bugs.
### Examples of business logic flaws.
#### Negative amounts.
Let us take an example of a user who purchases a mobile phone at KES. 15,000. In a business logic flaw the user might be able to buy the mobile phone at a lower price by maybe changing the price or the quantity which interferes with the total amount.
#### Broken password reset logic
An application allows users to reset their password in case they forget their password, the user then enters their email or username and can then reset their password using the link provided. 
In some cases developers might pass the email or the username of the user who is changing their credentials which gives the attacker a chance to change this values when they intercept the parameters being parsed to the server and change the password of a user of their choice.
### Prevention
To prevent cases of business logic flaws the following can be done:
1. Coming up with system designs so as to cover all bases.
2. Writing clean code so as to understand what is happening.
3. Understanding the problem that your application solves.
4. Do **NOT** make any assumptions.
