To facilitate global provision of cloud services AWS has data centers spread across the globe which are divided into multiple regions, to get an updated list of regions, visit https://aws.amazon.com/about-aws/global-infrastructure/regions_az/ as it has most of the regions.
When setting up cloud infrastructure, a region might be chosen based on the following rationale:
1. Regulatory compliance
2. Cost.
3. Availability of services
4. Latency of the service you want to deploy.

Some services are available in specific regions and some may be available in multiple regions take an example, we might not have EC-2 in the South Africa data center but we may have it on the US-east region.
Global services are services that are available in all the regions as they may facilitate things like efficient delivery of services take an example of route 53 which provides DNS for AWS. This is denoted as global and one does not choose the region for this particular service.
Availability zones are small data centers located in one location, in most cases, a region has three data centers. This is done this way to ensure availability of services should there be an issue at one data center. It is also possible for users to set up High Availability for their service to ensure that their service is available. On AWS a subnet is associated with an Availability Zone especially for services managed by AWS.
### Fault tolerance
Fault domain: Section of network that is vulnerable to damage is a device fails that does not affect other devices. A lot of fault domains create a fault level. 
### Global network
#### Edge locations
These are locations that act as on and off ramps to the AWS Global network. We can run a service like S3 as an on-ramp to make it easier to reach to AWS services on other regions. Services like Cloudflront use edge locations to providde storage that end users the ability to retrieve resources fast. 
#### Point of Presence
This is a set of resources owned by AWS or a trusted partner that stores popular data as a cache which makes it possible for users to retrieve and upload  data faster than visiting the original server as it leverages AWS' global network.
#### Data residency
Physical location where data or resources reside.
##### Compliance boundaries
A regulatory requirement that describes where data and cloud resources are allowed to reside. 
##### Data sovereignty
This is the jurisdictional control or legal authority that can be asserted over data because it's physical location is within jurisdictional boundaries.

