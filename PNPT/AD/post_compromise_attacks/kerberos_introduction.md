When a user logs in their username and an encrypted version of their timestamp, which is done using the password is sent to the Domain Controller who is incharge of creating tickets in the network.
The DC through the Key Distribution Center (KDC) will send back a Ticket Granting Ticket (TGT) which allows the user to request for tickets without passing their credentials whenever they need to connect to a service.
The TGT is encrypted using the krbtgt account's password hash.

When a user needs to access a website or a share on the network they need to request a Ticket Granting Service (TGS) which allows users to use services they were created for.