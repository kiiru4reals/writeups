#### Setting up Vault
Setting up and installing Vault has to be one of the easiest things ever. In this case I shall be using Ubuntu to show do the set up. 
First we are going to install pgp for the package signing key

`sudo apt update && sudo apt install gpg`

Then we are going to add the HashiCorp GPG key.
`wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null`

We will then verify the key's fingerprint and add the official HashiCorp Linux repository.
`gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint`
`echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list`

At this point we are then ready to install Vault. 
`sudo apt update && sudo apt install vault`