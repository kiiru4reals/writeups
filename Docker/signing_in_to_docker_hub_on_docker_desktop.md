To push your images to docker hub from your local machine, you need to sign in from the docker desktop application. This guide is meant specifically for Linux users.

When signing in to Dockerhub, you have probably gotten the following dialog
![[docker_hub_error.png]]
This is how to solve it.
1. Initialize pass using a gpg key. To generate a gpg key, you can use the following command `gpg --generate-key`
2. Once you have generated your gpg key, you need to initialise it. You can initialize it using `pass init <pub_code>`

Once you do this, you can login again.