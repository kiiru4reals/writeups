`Error checking seal status: Get "https://127.0.0.1:8200/v1/sys/seal-status": http: server gave HTTP response to HTTPS client`
1. This can be resolved by exporting the address value again.
	`export VAULT_ADDR="http://localhost:8200"`
2. You can also restart the server.

`ERROR] auth.github.auth_github_b38e0157: unable to fetch the organization_id, you must manually set it in the config: GET https://api.github.com/orgs/<organisation_name>: 404 Not Found []
`
This is an issue with the organization, you need to create an organisation on GitHub. To create an organisation, you can check out this part of the [GitHub documentation](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch).


`Error unsealing: Put "http://127.0.0.1:8200/v1/sys/unseal": dial tcp 127.0.0.1:8200: connect: connection refused`

Ensure that the address put on the listener on Vault is the same as what you export.
In a production case use `export VAULT_ADDR=<vault_server_ip:8200>`
