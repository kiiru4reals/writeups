Now that we have powerview installed, we need to run the following
```sh
powershell -ep bypass
```

We can run Powerview by doing:
```sh
. .\Powerview.ps1
```

Nothing is not going to happen once you run the above command

We can get information about the domain by typing

```sh
Get-NetDomain
```
This will give us information about the domain.

We can get information about the Domain Controller by typing
```sh
Get-NetDomainController
```
We can get domain policies by typing:
```sh
Get-DomainPolicy
```

To get specific policy information, we can run the following commands
```sh
(Get-DomainPolicy)."system access"
```

To get user information, we can run the following command
```sh
Get-NetUsers
```

To get specific information we can pipe the results of the command above by doing the following
```sh
Get-NetUsers | select "cn"
```
This will show us the common names of the users in the domain.

We can be able to see the properties by typing the following command
```sh
Get-UserProperty -Properties badpwdcount
```
The last value can be changed to the property one is interested in checking.

To get computers in the domain we can do the following
```sh
Get-NetComputer
```
To get more information, we can run the following command
```sh
Get-NetComputer -FullData
```
We can pipe this result by typing
```sh
Get-NetComputer -FullData | <key_name>
```

To find groups, we can do 
```sh
Get-NetGroup
```
To sort by name we can do
```sh
Get-NetGroup -GroupName "Domain Admins"
```

We can sort using wildcards as well to get the group names
```sh
Get-NetGroup -GroupName *admin*
```
This is going to give us results of all the groups that bear the name admin.

We can then run members of a certain group by running the following command
```sh
Get-NetGroupMember -GroupName "<group_name>"
```

#### Invoke-Sharefinder
This is a sub-module that is used to enumerate for shares in a domain. This command can be used to discover shares that you might have missed. 

```sh
Invoke-ShareFinder
```
