For us to get started we need to download and run the Wazuh installation assistant
`curl -sO https://packages.wazuh.com/4.3/wazuh-install.sh && sudo bash ./wazuh-install.sh -a`

Once the installation runs we shall be presented with the Wazuh username and passwords. You can now navigate to https://<wazuh_server_ip> and login using the given credentials.

Your credentials are stored in the `wazuh-passwords.txt` file which is inside the `wazuh-install-files.tar` 