`[API version] Wazuh API and Wazuh App version mismatch. API version: 4.3.6. App version: 4.2.2. At least, major and minor should match. Check more info about upgrading Wazuh App [here](https://documentation.wazuh.com/current/upgrade-guide/elasticsearch-kibana-filebeat/index.html#upgrade-elasticsearch-filebeat-kibana).`

Follow the instructions [here](https://documentation.wazuh.com/current/upgrade-guide/elasticsearch-kibana-filebeat/upgrading-open-distro.html)

`Failed to reset password. {"status":"FORBIDDEN","message":"Resource 'admin' is read-only."}`

This happens when you try to reset you password. If this is an issue. You can navigate to `/etc/filebeat/filebeat.yml` and change your password from there.

`Kibana server is not ready yet wazuh`
This happens when you make a change on the configurations. Don't stress, give it 5-10 minutes as the server starts.


##### [Alerts index pattern] No template found for the selected index-pattern title [wazuh-alerts-*]
This is because wazuh does not have the template to store alerts, hence might not be able to provide visualisations. To solve this you need to enter the following command:
`curl https://raw.githubusercontent.com/wazuh/wazuh/v4.3.8/extensions/elasticsearch/7.x/wazuh-template.json | curl -X PUT "https://localhost:9200/_template/wazuh" -H 'Content-Type: application/json' -d @- -u <elasticsearch_username>:<elasticsearch_password> -k`
