We are going to cover authentication into vault
#### Token authentication
We will now create our first token using `vault token create`
We get the following output
```
Key                  Value
---                  -----
token                hvs.ulLv0WRKEZWs4IHIbMaojvH4
token_accessor       ev0nwFXbYTOOUuyLsyYKdLpt
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]

```
We can see we got `hvs.ulLv0WRKEZWs4IHIbMaojvH4` as the token.

We can now try to login using our vault token using `vault login`, you can see we are now prompted to put our token to login after that we get the following:
```
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

Key                  Value
---                  -----
token                hvs.ulLv0WRKEZWs4IHIbMaojvH4
token_accessor       ev0nwFXbYTOOUuyLsyYKdLpt
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]

```
You can go ahead and create a new token.

##### Revoking tokens
We can now try and revoke the token we have created by typing `vault token revoke <token>`. We can now try and revoke the token
`vault token revoke hvs.ulLv0WRKEZWs4IHIbMaojvH4`
We get the following output
`Success! Revoked token (if it existed)`
If we attempt to login with the revoked token we get the following error
```
Error authenticating: error looking up token: Error making API request.

URL: GET http://127.0.0.1:8200/v1/auth/token/lookup-self
Code: 403. Errors:

* permission denied
```
It is important to note any token revoked will revoke all tokens created by that token.

