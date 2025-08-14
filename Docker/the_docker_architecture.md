ll### Introduction
What really makes up docker? What is docker really composed of under the hood? What happens when I enter the command `docker run`. Well let us find out what run uner the hood of this wonderful piece of technology called Docker.
### Breaking down Docker
Docker is encapsulated under one huge umbrella of what is known as the Docker engine. The docker engine is composed of the docker client, a REST API and the docker daemon.
#### Docker client
The docker client is the top-most level of the docker engine, this is where the user gets to interact with the docker client. In most cases, the docker client is abstracted by the Docker Desktop GUI. This allows the end-user to build docker images, deploy containers, create new networks and storage volumes. 
#### REST API
The REST API is an interface which the client uses to interact with the daemon. In most cases where one enters a command on the client or invoke a function it is parsed through the REST API to the Docker daemon.
#### Docker daemon
This is the brains behind docker as a whole. This is where the real abstraction takes place. The docker daemon handles the abstraction and other functions that connects to the virtual machine. 