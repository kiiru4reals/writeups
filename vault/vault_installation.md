#### Introduction
Lately I have been looking for a good solution for authentication and storage of secrets for my personal projects. I was looking for something that will allow me to store my secrets away from my code, use of top-of-the-line security. This is when I stumbled on HashiCorp's [Vault](https://www.vaultproject.io/). Vault assists you to control access to tokens, passwords, certificates among other stuff. This when combined with your infrastructure makes it easier to carry out a secret audit and makes it easy to detect the source of a leak when it happens.

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