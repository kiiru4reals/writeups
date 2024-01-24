### Have backups
The master node on your K8s clusters should be backed up in case a situation happens.
### Storage of env information
env information should be stored in the config maps but this should be restricted to non-confidential information. Confidential information should be stored in secrets.
### Host databases separate from the application cluster.
This is to reduce the tediousness of setting up a statefulset app and a replica.