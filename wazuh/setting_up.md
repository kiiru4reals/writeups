Now that we have installed Wazuh, we need to set it up and configure it. When you first login you are redirected to the Wazuh homepage.

#### Changing default credentials
To change the default credentials we first need to edit the filebeat YAML configuration file.
##### filebeat.yml
For us to edit this configuration file, we need to ssh into our instance.
We then navigate to the filebeat.yml file which is located at `/etc/filebeat/filebeat.yml`