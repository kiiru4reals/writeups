### Where are GraphQL endpoints found
- GraphQL has various implementations based on different programming languages.
- Depending on scalability you may need to determine if a server is running GraphQL using automated or manual methods.
- In most cases applications running graphql have `/graphql` as the default endpoint or `/v1/graphql` or `v2/graphql` for purposes of backward and forward compatibility.
- Once can also find GraphQL endpoints using IDEs? when this is enabled, we can find GraphQL endpoints using the endpoint `/graphiql` 
### How does GraphQL responds to requests.
- When a query is made it should respond in two ways either:
	- The response will be a json with the data field returning the GraphQL client's query.
	![[Pasted image 20240224142841.png]]
	- The response will be an errors JSON field whenever an error occurs when a query is made.
	![[Pasted image 20240224142939.png]]
### Using nmap
- Nmap can be used to determine if a server has GraphQL running. To do this we can use the `http-grep` script and add a response for cases where the client makes a GET request to the server.
- We can use the above script to look for keywords in a given webpage in this case we used DVGA.
```sh
sudo nmap -p 5013 -sV --script=http-grep --script-args='match="Must provide query string", http-grep.url="/graphql"' 127.0.0.1
```
#### What happens if I do not know the fields that exists in a GraphQL application?
- We can use metafields to find out more information about a query or a GraphQL arguement of any sort.
- A metafield is a field in GraphQL that provides more information in relation to a certain field or query in the schema.
- In cases where GraphQL allows GET requests, we can automate the detection of GraphQL using nmap easily as shown below
```sh
sudo nmap -p 5013 -sV --script=http-grep --script-args='match="_typename", http-grep.url="/graphql?query=\{__typename\}"' 127.0.0.1
```
The output is as follows:
![[Pasted image 20240224151450.png]]
- In a case, where a GraphQL endpoint does not support GET requests, we can use curl to send make POST requests to the server and get output as shown below
```sh
curl -X POST http://127.0.0.1:5013/graphql -d '{"query":"{__typename }"}'-H "Content-Type: application/json"
```
### Using Graphw00f
- Graphw00f is a CLI python tool that is used in assisting to determine GraphQL endpoints.
- This tool uses either the wordlist that is hardcoded and called on runtime or one can supply their own wordlist, below are the hardcoded endpoints.
![[Pasted image 20240224152501.png]]
- We can run this tool as shown below
```sh
python main.py -d -t http://127.0.0.1:5013/
```
- Graphw00f will iterate through the list that I showed above to find the endpoint, in cases where we need to add a wordlist, we can add the `-w` flag as shown below
```sh
python main.py -d -t http://127.0.0.1:5013/ -w rockyou.txt
```
### Recon using introspection.
- Introspection is a developer-friendly feature that provides insights into the supported fields in a query.
- This removes the extra work of relying on documentations to get information about the GraphQL endpoint.
- This is made possible using the `__schema` query to get information on the schema as shown below
![[Pasted image 20240224161006.png]]
- The above request shows the name of all the types available on the GraphQL schema. This only provides the information on the names of the types which can also suggest some of the features available.
- We can make a better query to have information about the GraphQL endpoint sich as the queries, mutations, subscriptions and what data can be processed as input as shown below.
![[Pasted image 20240224162100.png]]
The above request gives us all the queries, mutations and subscriptions, their names and fields.
- To determine if a GraphQL server allows introspection queries we can use the `graphql-introspection` script on nmap as shown below
```sh
sudo nmap --script=graphql-introspection -sV -p 5013 127.0.0.1
```
- This script is not available on nmap out of the box, to download this you need to get the script from [here](https://github.com/dolevf/nmap-graphql-introspection-nse/blob/master/graphql-introspection.nse) and add it to the `/usr/share/nmap/scripts` directory.
![[Pasted image 20240224163416.png]]
### Introspection using Burpsuite
- In this case we shall use Postman as our User Agent and send requests to our GraphQL server which shall be intercepted using Burp suite.
- We shall send a request to our server from Postman as shown below
![[Pasted image 20240224182217.png]]
- We intercept the request and send it to the repeater as shown below
![[Pasted image 20240224182504.png]]
- When you right click the request pane on the repeater, we have a GraphQL place, where we select "GraphQL > Set introspection query." The request will be modified to what is shown below and send the request
![[Pasted image 20240224183146.png]]
- From the response, we have information about the queries, mutations, subscriptions and their respective fields.
- We can save the response to the sitemap by right clicking the Response pane and selecting "GraphQL > Save GraphQL queries to site map."
- When we visit the sitemap, we get the following results.
![[Pasted image 20240224183618.png]]

### Visualizing introspection

### Disabled introspection
- In cases where introspection is disabled you get the following error
![[Pasted image 20240224173028.png]]
To be continued.
### Fingerprinting GraphQL servers
- As part of reconnaisance, we need to find out if our GraphQL server is Apollo, Graphene, Sangria etc etc. Each programming language has their own GraphQL implementation.
- These servers handle errors differently. To perform fingerprinting, we can use graphw00f based on this premise. 
- This is made fingerprinting using the `-f` flag, this is applied as shown below
```sh
python main.py -d -f -t http://127.0.0.1:5013
```

Other links
Previous: [[Threat modelling GraphQL applications]]
