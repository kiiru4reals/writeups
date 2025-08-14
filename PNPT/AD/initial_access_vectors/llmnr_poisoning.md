### LLMNR Poisioning
- LLMNR: Link local Multi Namecast Resolution
- This is used to identify hosts when name fails to do so.
- The service responds to use by providing a username and password hash.
### How it works
1. User tries to connect to a server that does not exist in the network.
2. The server gives an error 404 as the server does not know of the existence of such a share or server.
3. The user then sends a broadcast asking who knows how to connect to the requested server.
4. A threat actor in the network then requests for the hash so as to connect to the network.
5. Victim shares the hash to the attacker.
### Tooling
We can use responder, which is a module available with impacket that does exactly what has been defined above.
This is best done in the morning or after lunch or when there is a lot of traffic on the network.
Once the hash is obtained it can be cracked by tools such as hashcat.