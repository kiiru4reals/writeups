AWS service that allow you to control satellite communications, process data and scale your operations without building your own ground station infrastructure. To use a ground station you need to:
1. Schedule a contact that is selecting a sattelite, the start and end time and the ground location.
2. Launch EC2 instances using Ground station that will provide an uplink and downlink data during the contact and store downlinked data in a S3 bucket.
