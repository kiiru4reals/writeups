### So who is a cloud architect?
This is a solutions architect that is focused on architecturing technical solutions using cloud services. A cloud architect needs to understand the factor the following when designing architecture based on business requirements:
1. Availability
2. Scalability
3. Elasticity: Ability to shrink and grow to meet the demand
4. Fault tolerance
5. Disaster recovery
Business factors to be considered include:
1. Security
2. Cost

### High availability
This is the concept of ensuring that a resource is always available by having it run on multiple zones at any given time, this is made possible by the use of a Load balancer in AWS this can be an Elastic Load Balancer that allows you to distribute traffic to multiple data centers. If a data center is unavailable, the load balancer only distributes traffic to the data center that can still provide that particular resource.
### Scalability
Ability to increase capacity based on the increasing demand of traffic, memory or computing power.
Scaling can either be:
1. Horizontal: Increasing the specs of the current server
2. Vertical: Increasing the number of servers with the same specs.
### Elasticity
Ability to automatically increase or decrease your capacity based on the demand of traffic memory or computing power. Elasticity is differednt from scaling as this is automated and relies more on horizontal scaling.
### Fault tolerance
Fail over is the ability to shift traffic to a redundant system in case the primary system fails. This ensures that the service does not have a single point of failure. 
### Durability
Ability to recover from a disaster to prevent the loss of data. A good question when evaluating ability to recover from a disaster include the following:
1. Is there a backup?
2. How fast can you restore that backup?
3. Does your backup still work?
4. How do you ensure that your current live data is not corrupt?
