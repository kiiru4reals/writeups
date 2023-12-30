### Introduction 
OS command injection is a vulnerability that allows an attacker to execute arbitrary OS commands on a server that is running an application.

### Executing arbitrary commands
Let us consider an e-commerce application that queries another file so as to look for a product and returns it to a user when it is discovered. 

When a query is made by the user, we can then go ahead to intercept the request and add an OS command to get information on the OS, it is also important to add a `&` after our query to ensure that what follows after we add our command does not execute.

### Blind OS command injection
In some cases, when we perform an OS command injection, we are not able to get an output of the query which makes it difficult to know if our attack was successful or not because there is no output.
To discover this we can use time delays by leveraging the ping command. The `ping` command is effective as you can use specify the number of requests one can use to send to the server and get the duration in which a response takes. An example of this can be shown below:

```sh
& ping -c 10 127.0.0.1 &
```
