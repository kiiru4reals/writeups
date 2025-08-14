#### Introduction
One of the methods of storing secrets in vault is using the key value secrets. The key:value secret are stored in the secrets/ folder. As indicated earlier secrets in vault are encrypted and the back-end storage does not see the encrypted value and does not have the means necessary to decrypt it.

#### Let's get started
Before starting the next part, you should verse yourself with the key value secret functionality.
`vault kv -help`
##### Storing secrets
To store our key value secret we can do the following:
`vault kv put mount=secret name_of_secret name=bl4ckr053 occupation=engineer`

Once you add the secret you are going to get the following output
```
== Secret Path ==
secret/data/hello

======= Metadata =======
Key                Value
---                -----
created_time       2022-08-16T12:50:19.890740518Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            1

```
We can now try and edit our secret and add something new

`vault kv put mount=secret name_of_the_secret name=bl4ckr053 occupation=engineer cryptocurrency=SOL`
When we make a modification we are going the following output 
```
== Secret Path ==
secret/data/hello

======= Metadata =======
Key                Value
---                -----
created_time       2022-08-16T12:53:24.890740518Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            2

```
As we can see the version changed 

##### Reading secrets
Now that we have stored secrets we can be able to see the secrets that we have read using  `vault kv get -mount=secret`. 
`vault kv get -mount=secret super`
This will fetch all secrets stored under super as shown below
```
== Secret Path ==
secret/data/super

======= Metadata =======
Key                Value
---                -----
created_time       2022-08-16T14:00:56.852095567Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            2

========= Data =========
Key               Value
---               -----
cryptocurrency    SOL
name              bl4ckr053
occupation        engineer

```
We can also a specific key-value pair from a secret file using the `-field` flag. Let us now try to get the cryptocurrency value. 
`vault kv get -mount=secret -field=cryptocurrency super`
`SOL`
We are able to see the query returns the value of cryptocurrency from the super file.

##### Deleting secrets
We can delete secrets that we have stored in our key-value vault using
`vault kv delete -mount=secret <secret_file_name>`  
We can now try to delete the secret that we created.
`vault kv delete -mount=secret super`
We now get the following reply
`Success! Data deleted (if it existed) at: secret/data/super`

We can also restore the secret if we deleted it by mistake by using the undelete command.
`vault kv undelete -mount=secret -versions=<secret_version> <secret_name>`
Let us now try to restore our deleted secret 
`vault kv undelete -mount=secret -versions=2 super`
We now get the following
`Success! Data written to: secret/undelete/super`
