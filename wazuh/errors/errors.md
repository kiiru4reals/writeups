`[API version] Wazuh API and Wazuh App version mismatch. API version: 4.3.6. App version: 4.2.2. At least, major and minor should match. Check more info about upgrading Wazuh App [here](https://documentation.wazuh.com/current/upgrade-guide/elasticsearch-kibana-filebeat/index.html#upgrade-elasticsearch-filebeat-kibana).`

Follow the instructions [here](https://documentation.wazuh.com/current/upgrade-guide/elasticsearch-kibana-filebeat/upgrading-open-distro.html)

`Failed to reset password. {"status":"FORBIDDEN","message":"Resource 'admin' is read-only."}`

This happens when you try to reset you password. If this is an issue. You can navigate to `/etc/filebeat/filebeat.yml` and change your password from there.