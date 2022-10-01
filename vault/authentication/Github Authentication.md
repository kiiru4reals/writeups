#### GitHub authentication
In situations where we need other people to authenticate to Vault we can have them use GitHub. Before we start you need to ensure that you have a GitHub profile, belong to a GitHub organisation, and have a GitHub access token with the read:org scope. 

Let us now enable a GitHub authentication using the command `vault auth enable github`. 

To prevent every Tom, Dick and Harry from authenticating to your system's vault, we need to set up an organisation in the organisation.

We can now set up the organisation using the command `vault write auth/github/config organisation=<your_organisation_name>`
We get the following output
`Success! Data written to: auth/github/config`

We can add privileges to different teams using Vault by using the command 
`vault write auth/github/map/teams/<team_name> value=default,applications`
We get the following output
`Success! Data written to: auth/github/map/teams/mobile`
##### Logging in with GitHub
We need to unset the root token that we set when we started the vault dev server.
`unset VAULT_TOKEN`
We can then proceed to authenticate to vault using GitHub.
`vault login -method=github`
When we log in we can see that the token we have been allocated is valid for 32 days.
###### Creating a personal Access Token
To create a personal access token, you can follow this part of the [GitHub documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
##### Revoking GitHub tokens
For us to revoke all GitHub tokens we can login as root using the command below
`vault login root`
We can now comfortably revoke the tokens generated by the github auth method.
`vault token revoke -mode path auth/github`
Then we can proceed to revoke all GitHub tokens
`vault token revoke -mode path auth/github`