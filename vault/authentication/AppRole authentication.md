#### Introduction
AppRole authentication is used to authenticate machines or systems with vault-defined roles and policies.

#### Probable use-cases
1. Authentication for web applications to read API keys.
2. Used by machines or micro-services to add.

#### Configuring vault authentication using AppRole
For you to continue further please ensure that you have access to the CLI.

You first need to enable vault authentication using AppRole by doing `vault auth enable approle`. We then need to create a named role specifying the TTL of the secret id, token version, token TTL, maximum token TTL.

```
vault write auth/approle/role/my-role \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40

```

<i> To see all the role parameters you can make you can view the parameters by typing `vault read auth/approle/role/my-role`</i>
Once we configure the policies, we get a success message.

We then proceed to get the role_id of the role we have created by using the command `vault read auth/approle/role/my-role/role-id`
We then get a key-value pair of the role-id.

We then proceed to get the secret-id issued against the AppRole.
`vault write -f auth/approle/role/my-role/secret-id`, from that we get the following
```
Key                   Value
---                   -----
secret_id             9a15c016-d69b-88dc-972e-05204aea9a13
secret_id_accessor    28abb090-7ddc-cc8f-5d08-a6153c3c7faa
secret_id_ttl         10m
```

