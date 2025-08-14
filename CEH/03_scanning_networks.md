This is the second stage of ethical hacking, at this point the attacker uses information obtained from footprinting to perform scans on the target network and get more information.
### Network scanning concepts
Network scanning is a set of procedures used in identifying hosts, ports and services in a network. This is done to probe as many hosts as possible and discover exploitable channels.
#### Types of scanning
1. Port scanning: scan for open ports.
2. Network scanning: Scan hosts and IP addresses.
3. Vulnerability scanning: Shows presence of weaknesses.
#### Objectives of network scanning.
1. To discover vulnerabilities.
2. TO know more about the network architecture.
3. Identify specific versions of the services running.
#### TCP Communication flags
There are six communication flags that TCP uses, these flags are used as insutructions to tell the different nodes involved what to do. They include:
1. SYN: Stands for synchronize used to start the connection with the recieving server.
2. ACK: Stands for acknowledge and is used to let the transmitting node know that the server has received internet connections.
3. RST: Stands for reset this is used to reset the connection, often used in network scans.
4. FIN: Stands for finish, this is used to terminate the connections.
5. PSH: Stands for push, used by the transmitting server to inform the receiving server of impending data from the sender.
6. URG: stands for urgent, this tells the transmission to treat a packet as priority.

### Host discovery techniques
#### ARP Ping scan
This checks the existence of hosts in the network by sending requests to the ARP table.
##### Advantages
1. More accurate results.
2. Displays the response time.
3. Useful for system discovery.
#### UDP Ping scan
This scan is used to discover hosts by sending UDP packets to the host. This is the best case when using this is where there is a firewall that filters TCP connections.
##### Advantages
1. Good for systems that have strict TCP control.
#### ICMP Echo Ping scan
Sending ping requests to check if a host is live.
#### ICMP Echo Ping sweep
This is sending ping requests to many hosts or a certain address block to determine if the server is live.
#### Ping Sweep countermeasures
1. Configure firewalls to detect ping sweeps.
2. Have an IDS that detects ping scans.

#### ICMP Timestamp Ping Scan
This is a type of ping scan where attackers query the timestamp to get the time of the server.
#### ICMP Address Mask Ping Scan
This is used like an ICMP Echo ping scan and is used to send address mask query the subnet mask to get infomration on the host, this scan is usually 50/50 and won't give you 100% accuracy.
#### TCP SYN Scan
Host discovery techniques for probing different ports to determine if the port is online. This sends a SYN to the target and the target responds with a SYNand pushes a RST flag.
##### Advantages.
1. Leaves no logs since no connection is established.
2. There is no timeout error as host is scanned in parallel.
#### TCP, ACK scan
The attacker sends a ACK scan to the target host which then responds with a RST to reset the connection since no connection had been earlier established.
