#### Introduction
Vault uses a client-server architecture where all keys and secrets are stored by the server. The client requests and stores secrets to the server where they are encrypted.

#### The dev server
The vault dev server is used to tinker around with vault's unique features and experiment without messing up what the production environment. Let us start our dev server by using the following command.
`vault server -dev`
You should an output that looks like this: 
``` ==> Vault server configuration:

             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
              Go Version: go1.17.12
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: info
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.11.2, built 2022-07-29T09:48:47Z
             Version Sha: 3a8aa12eba357ed2de3192b15c99c717afdeb2b5

==> Vault server started! Log data will stream in below:

2022-08-16T10:59:38.958Z [INFO]  proxy environment: http_proxy="" https_proxy="" no_proxy=""
2022-08-16T10:59:38.958Z [WARN]  no `api_addr` value specified in config or in VAULT_API_ADDR; falling back to detection if possible, but this value should be manually set
2022-08-16T10:59:38.959Z [INFO]  core: Initializing version history cache for core
2022-08-16T10:59:38.962Z [INFO]  core: security barrier not initialized
2022-08-16T10:59:38.962Z [INFO]  core: security barrier initialized: stored=1 shares=1 threshold=1
2022-08-16T10:59:38.963Z [INFO]  core: post-unseal setup starting
2022-08-16T10:59:38.968Z [INFO]  core: loaded wrapping token key
2022-08-16T10:59:38.968Z [INFO]  core: Recorded vault version: vault version=1.11.2 upgrade time="2022-08-16 10:59:38.968619975 +0000 UTC" build date=2022-07-29T09:48:47Z
2022-08-16T10:59:38.968Z [INFO]  core: successfully setup plugin catalog: plugin-directory=""
2022-08-16T10:59:38.969Z [INFO]  core: no mounts; adding default mount table
2022-08-16T10:59:38.973Z [INFO]  core: successfully mounted backend: type=cubbyhole path=cubbyhole/
2022-08-16T10:59:38.977Z [INFO]  core: successfully mounted backend: type=system path=sys/
2022-08-16T10:59:38.978Z [INFO]  core: successfully mounted backend: type=identity path=identity/
2022-08-16T10:59:38.986Z [INFO]  core: successfully enabled credential backend: type=token path=token/ namespace="ID: root. Path: "
2022-08-16T10:59:38.987Z [INFO]  core: restoring leases
2022-08-16T10:59:38.988Z [INFO]  rollback: starting rollback manager
2022-08-16T10:59:38.989Z [INFO]  expiration: lease restore complete
2022-08-16T10:59:38.989Z [INFO]  identity: entities restored
2022-08-16T10:59:38.989Z [INFO]  identity: groups restored
2022-08-16T10:59:39.438Z [INFO]  core: post-unseal setup complete
2022-08-16T10:59:39.438Z [INFO]  core: root token generated
2022-08-16T10:59:39.438Z [INFO]  core: pre-seal teardown starting
2022-08-16T10:59:39.438Z [INFO]  rollback: stopping rollback manager
2022-08-16T10:59:39.439Z [INFO]  core: pre-seal teardown complete
2022-08-16T10:59:39.439Z [INFO]  core.cluster-listener.tcp: starting listener: listener_address=127.0.0.1:8201
2022-08-16T10:59:39.439Z [INFO]  core.cluster-listener: serving cluster requests: cluster_listen_address=127.0.0.1:8201
2022-08-16T10:59:39.439Z [INFO]  core: post-unseal setup starting
2022-08-16T10:59:39.439Z [INFO]  core: loaded wrapping token key
2022-08-16T10:59:39.439Z [INFO]  core: successfully setup plugin catalog: plugin-directory=""
2022-08-16T10:59:39.440Z [INFO]  core: successfully mounted backend: type=system path=sys/
2022-08-16T10:59:39.441Z [INFO]  core: successfully mounted backend: type=identity path=identity/
2022-08-16T10:59:39.441Z [INFO]  core: successfully mounted backend: type=cubbyhole path=cubbyhole/
2022-08-16T10:59:39.442Z [INFO]  core: successfully enabled credential backend: type=token path=token/ namespace="ID: root. Path: "
2022-08-16T10:59:39.443Z [INFO]  core: restoring leases
2022-08-16T10:59:39.445Z [INFO]  expiration: lease restore complete
2022-08-16T10:59:39.445Z [INFO]  rollback: starting rollback manager
2022-08-16T10:59:39.445Z [INFO]  identity: entities restored
2022-08-16T10:59:39.446Z [INFO]  identity: groups restored
2022-08-16T10:59:39.446Z [INFO]  core: post-unseal setup complete
2022-08-16T10:59:39.446Z [INFO]  core: vault is unsealed
2022-08-16T10:59:39.454Z [INFO]  core: successful mount: namespace="" path=secret/ type=kv
2022-08-16T10:59:39.460Z [INFO]  secrets.kv.kv_8482edeb: collecting keys to upgrade
2022-08-16T10:59:39.460Z [INFO]  secrets.kv.kv_8482edeb: done collecting keys: num_keys=1
2022-08-16T10:59:39.461Z [INFO]  secrets.kv.kv_8482edeb: upgrading keys finished
```

We can then proceed to export our vault address as stated in the output above
`export VAULT_ADDR='http://127.0.0.1:8200'`

Next we need to save the vault token which is the root token value shown on the terminal.
`export VAULT_TOKEN=<"your_vault_token">`
You can then verify if the vault server is running
`vault status`

In case you get an error, you can try restarting your server.