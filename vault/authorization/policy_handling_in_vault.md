Policies in vault is handled by the [Hashicorp Configuration Language](https://github.com/hashicorp/hcl.git) (HCL).

To start you off Vault has two policies that have been set up for you. These policies include:
				<ul>
				<li>Default policy</li>
				<li>Root policy</li>
				</ul>
We can be able to see this policies using the command `vault policy list` which will display all those policies. 

#### Reading policies
To read policies you have to enter the command `vault policy read <policy_name>`. With this knowlege, we can try to read the default policy and see the output.
`vault read policy default`
We get
```
# Allow tokens to look up their own properties
path "auth/token/lookup-self" {
    capabilities = ["read"]
}

# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}

# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}

# Allow a token to look up its own capabilities on a path
path "sys/capabilities-self" {
    capabilities = ["update"]
}

# Allow a token to look up its own entity by id or name
path "identity/entity/id/{{identity.entity.id}}" {
  capabilities = ["read"]
}
path "identity/entity/name/{{identity.entity.name}}" {
  capabilities = ["read"]
}


# Allow a token to look up its resultant ACL from all policies. This is useful
# for UIs. It is an internal path because the format may change at any time
# based on how the internal ACL features and capabilities change.
path "sys/internal/ui/resultant-acl" {
    capabilities = ["read"]
}

# Allow a token to renew a lease via lease_id in the request body; old path for
# old clients, new path for newer
path "sys/renew" {
    capabilities = ["update"]
}
path "sys/leases/renew" {
    capabilities = ["update"]
}

# Allow looking up lease properties. This requires knowing the lease ID ahead
# of time and does not divulge any sensitive information.
path "sys/leases/lookup" {
    capabilities = ["update"]
}

# Allow a token to manage its own cubbyhole
path "cubbyhole/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to wrap arbitrary values in a response-wrapping token
path "sys/wrapping/wrap" {
    capabilities = ["update"]
}

# Allow a token to look up the creation time and TTL of a given
# response-wrapping token
path "sys/wrapping/lookup" {
    capabilities = ["update"]
}

# Allow a token to unwrap a response-wrapping token. This is a convenience to
# avoid client token swapping since this is also part of the response wrapping
# policy.
path "sys/wrapping/unwrap" {
    capabilities = ["update"]
}

# Allow general purpose tools
path "sys/tools/hash" {
    capabilities = ["update"]
}
path "sys/tools/hash/*" {
    capabilities = ["update"]
}

# Allow checking the status of a Control Group request if the user has the
# accessor
path "sys/control-group/request" {
    capabilities = ["update"]
}

# Allow a token to make requests to the Authorization Endpoint for OIDC providers.
path "identity/oidc/provider/+/authorize" {
	capabilities = ["read", "update"]
}
```
#### Writing policies
To write policies we use the command `vault policy write <policy_name>` . We can also open up the help menu to understand further how to write policies with Vault.
`vault policy write -h`
```
Usage: vault policy write [options] NAME PATH

  Uploads a policy with name NAME from the contents of a local file PATH or
  stdin. If PATH is "-", the policy is read from stdin. Otherwise, it is
  loaded from the file at the given path on the local disk.

  Upload a policy named "my-policy" from "/tmp/policy.hcl" on the local disk:

      $ vault policy write my-policy /tmp/policy.hcl

  Upload a policy from stdin:

      $ cat my-policy.hcl | vault policy write my-policy -

HTTP Options:

  -address=<string>
      Address of the Vault server. The default is https://127.0.0.1:8200. This
      can also be specified via the VAULT_ADDR environment variable.

  -agent-address=<string>
      Address of the Agent. This can also be specified via the
      VAULT_AGENT_ADDR environment variable.

  -ca-cert=<string>
      Path on the local disk to a single PEM-encoded CA certificate to verify
      the Vault server's SSL certificate. This takes precedence over -ca-path.
      This can also be specified via the VAULT_CACERT environment variable.

  -ca-path=<string>
      Path on the local disk to a directory of PEM-encoded CA certificates to
      verify the Vault server's SSL certificate. This can also be specified
      via the VAULT_CAPATH environment variable.

  -client-cert=<string>
      Path on the local disk to a single PEM-encoded CA certificate to use
      for TLS authentication to the Vault server. If this flag is specified,
      -client-key is also required. This can also be specified via the
      VAULT_CLIENT_CERT environment variable.

  -client-key=<string>
      Path on the local disk to a single PEM-encoded private key matching the
      client certificate from -client-cert. This can also be specified via the
      VAULT_CLIENT_KEY environment variable.

  -header=<key=value>
      Key-value pair provided as key=value to provide http header added to any
      request done by the CLI.Trying to add headers starting with 'X-Vault-'
      is forbidden and will make the command fail This can be specified
      multiple times.

  -mfa=<string>
      Supply MFA credentials as part of X-Vault-MFA header. This can also be
      specified via the VAULT_MFA environment variable.

  -namespace=<string>
      The namespace to use for the command. Setting this is not necessary
      but allows using relative paths. -ns can be used as shortcut. The
      default is (not set). This can also be specified via the VAULT_NAMESPACE
      environment variable.

  -non-interactive
      When set true, prevents asking the user for input via the terminal. The
      default is false.

  -output-curl-string
      Instead of executing the request, print an equivalent cURL command
      string and exit. The default is false.

  -output-policy
      Instead of executing the request, print an example HCL policy that would
      be required to run this command, and exit. The default is false.

  -policy-override
      Override a Sentinel policy that has a soft-mandatory enforcement_level
      specified The default is false.

  -tls-server-name=<string>
      Name to use as the SNI host when connecting to the Vault server via TLS.
      This can also be specified via the VAULT_TLS_SERVER_NAME environment
      variable.

  -tls-skip-verify
      Disable verification of TLS certificates. Using this option is highly
      discouraged as it decreases the security of data transmissions to and
      from the Vault server. The default is false. This can also be specified
      via the VAULT_SKIP_VERIFY environment variable.

  -unlock-key=<string>
      Key to unlock a namespace API lock. The default is (not set).

  -wrap-ttl=<duration>
      Wraps the response in a cubbyhole token with the requested TTL. The
      response is available via the "vault unwrap" command. The TTL is
      specified as a numeric string with suffix like "30s" or "5m". This can
      also be specified via the VAULT_WRAP_TTL environment variable.
```
We can try writing a new policy and let us call it my-policy 

```
$ vault policy write my-policy - << EOF
# Dev servers have version 2 of KV secrets engine mounted by default, so will
# need these paths to grant permissions:
path "secret/data/*" {
  capabilities = ["create", "update"]
}

path "secret/data/foo" {
  capabilities = ["read"]
}
EOF

```

Above we have created a policy called my policy which we give ourselved capabilities to update and update everything in the path of `secrets/data/*` and to only read information in `secrets/data/foo`

Once we update this policy we get the following output
`Success! Uploaded policy: my-policy`

When we list our policies we get our new policy there
```
default
my-policy
root
```

