After all is said and done, we are now ready to deploy vault server. First we need to set up a foundation for where our data will reside.

We start by setting up a directory for the data 
`mkdir -p ./vault/data`

At this point we can now write our [config](https://github.com/kiiru4reals/writeups/blob/main/vault/deployment/sample_config.hcl) file.

```
storage "raft" {
	path = "./vault/data"
	node_id = "node1"
}

listener "tcp" {
	address = "localhost:8200"
	disable_tls = true
}

api_addr = "http://localhost:8200"
cluster_addr = "http://localhost:8201"
ui = true

```
We can now point vault to where we have stored this config file. In my case I prefer to store it in the .vault/ directory.

#### Bl4ckr053 from the future
In a production environment we should not disable TLS as to secure data in transit.

We need to export the vault address and we'll do it below
`export VAULT_ADDR="http://localhost:8200"`

#### Initializing vault
For us to initialize vault we need to type the following command.
`vault operator init`

From this command we get five unseal keys which are very important. These keys are used to unseal a vault instance. You need atleast three keys to unseal your vault instance. 

#### Situations where you might need to unseal your vault instance
1. When you first initialize vault.
2. After you restart vault.

#### Unsealing vault
For us to unseal Vault we need to type the following command
`vault operator unseal`
We are now prompted to enter our unseal key(s), remember we need at least three keys to unseal our instance.

Once we unseal our vault we get the following information
```
Seal Type               shamir
Initialized             true
Sealed                  false
Total Shares            5
Threshold               3
Version                 1.11.2
Build Date              2022-07-29T09:48:47Z
Storage Type            raft
Cluster Name            vault-cluster-a9f5019d
Cluster ID              4a26a98a-1cf4-ad76-6ab0-840d2698b268
HA Enabled              true
HA Cluster              https://127.0.0.1:8201
HA Mode                 active
Active Since            2022-08-19T17:20:21.010130846Z
Raft Committed Index    36
Raft Applied Index      36

```

You can now try and login with the token you got when you initialized vault.
`vault operator login`
You get
```
Key                  Value
---                  -----
token                hvs.RRBCP2PdRGeJiaGxqOP7FX6b
token_accessor       ChQDhL71AIvgd3gn8TacUic4
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]

```

