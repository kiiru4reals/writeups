### Introduction
Like REST, GraphQL is not a stranger to information disclosure. Information disclosure can lead to very devastating security vulnerabilities and is often regarded to a precursor to more attacks as this vulnerability is discovered during the reconnaissance stage and can be chained to execute more sophisticated attacks.
#### Leveraging introspection
To discover information disclosure, we can use inQL to run an introspection query on our target, this will dump the schema in JSON format for us to read as shown below
![[Pasted image 20240420110956.png]]
Once we have the schema, we can upload the schema to GraphQL voyager to analyze the schema further.
#### Disabled introspection
In some cases, developers may disable introspection on their application which makes it more gather information about our GraphQL endpoint. This can be bypassed with some techniques as shown below:
1. Enumerating field suggestions.
2. Field stuffing.
3. Automation of field suggestions and field stuffing using Clairvoyance.
##### Detecting disabled introspection
We can check for disabled introspection by trying to analyze our gateway using InQL, in cases where introspection is disabled we get the following error
![[Pasted image 20240420112026.png]]
In cases where we do not have InQL, we can use the `__schema` meta-field to detect introspection, if we have introspection disabled we will have the following error
![[Pasted image 20240420112720.png]]
As an alternative, we can look for non-production environments which have other subdomains such as `dev.y.com`, `staging.y.com` and other examples, if we find other GraphQL API gateways we can pause the mission of bypassing introspection on endpoints that have introspection disabled.
### Field suggestions
When we get a word spelled wrong or a field, GraphQL usually returns an error with alternate fields, an example can be shown on the query below
![[Pasted image 20240420115201.png]]
In the query above, we have a typo on the spelling of the word content,  you can see the response gave us a suggestion on the typo we had. An attacker can leverage this to create a brute forcing tool to determine the fields in a GraphQL query. 
It is important to note that there is not limit to the number of typos that one can make in a query. This can make it possible for one to automate these attacks and discover potential vulnerabilities.
### Field stuffing
This is basically guessing the name of fields in a query, in a case where we only know one field and we are trying to guess other field names. This is done continuously to get fields that can be executed in one query say for example we have this field. We can have this query shown below:
```graphql
"query":"query getPastes {\n        pastes(public:true) {\n          id\n          title\n          }\n        }"
```
This query only shows public pastes, their id and title. We can add other names to guess if other fields actually exist by executing this query.
### Automating field suggestions and field stuffing using Clairvoyance
Clairvoyance is a tool that is meant to perform field stuffing and develop field suggestions in situations where introspection is disabled. This is made possible by having it run a wordlist on the GraphQL endpoint, when it is used it produces a schema in JSON format. To get started you can run the following command

```sh
pip install clairvoyance
```

We can run clairvoyance from the terminal by running the following command:

```sh
clairvoyance http://localhost:5013 -w cool_wordlist.txt -o schema.json
```
This command will give us a schema that is stored on `schema.json`. We can then copy our `schema.json` file to Voyager to be able to analyze our results. 
Disclaimer: My results are not as good as my laptop kept freezing in the middle and I had to restart it.
![[Pasted image 20240420200813.png]]
### Abusing Error messages
GraphQL tends to share too much information in its error messages, it is important to note that GraphQL handles errors differently compared to REST as it returns a code 200 response and the error as the body of the response.
![[Pasted image 20240420115201.png]]
We can see an example on how errors are handled on the typo screenshot above and lets us break down the fields below:
1. message: This is the specific information that is causing the error, in our case it is a typo.
2. location: This pinpoints exactly where the error is, this comes in handy in really long queries.
3. path: This is used to reference a particular field, this usually comes up in a scenario where a value that is not expected to be null comes up as null, in our case this is not shown as it is a query.
4. extensions: This is used to extend the above fields and are usually reserved for plugins and information like error codes and timestamps
#### Case one: Excessive error messages that allows us to enumerate the database.
Ted wants to sign up on our application and he only needs to make his account only once, if he does the action again or if someone gets to try and create a new account using his username this is what they will get as a response.
![[Pasted image 20240420203216.png]]
From the message, we are able to get an error showing the database that is used by the application and the table structure of the table `users`, we can also infer that the password field is not well handled during account creation as it is not hashed on insertion.
### Enabling debugging
Applications usually have an ability to toggle debug mode on or off, this brings about the ability of viewing highly verbose application errors to the user. This makes it possible for users to view errors that have not been standardized which may give threat actors the ability to gain information that can be used to further their attacks on the target application. In some cases, debug mode may be enabled through cookies or even URL parameters, this is difficult to see in the wild but is only useful in CTF environments. On magento, a client may start debug mode by envoking `?XDEBUG_SESSION_START=PHPSTORM` on the URL.