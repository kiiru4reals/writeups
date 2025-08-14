To defend LLMNR we can do the following:
1. Disable LLMNR  ro disable it selsect Turn off Multicast Name Resolution on the path `Local Computer Policy > Conputer Configuration > Administrative Templates > Network > DNS Client in the Group Policy Editor`
2. Disable NBT-NS on the path `Network Connections > Network Adapter Properties > TCP/IPv4 properties > Advanced tab > WINS tab` select "DIsable NetBIOS over TCP/IP"
For this to work effectively one needs to disable both as they both rely on one another to operate.
In cases where one relies on LLMNR/NBT-NS, the best thing to do can be: 
1. Require Network Access Control: Whitelist hosts using MAC addresses such that when a host connects their MAC address needs to be known.
2. Have a strong password policy- This does not stop the attack from happening but will increase the expense.
