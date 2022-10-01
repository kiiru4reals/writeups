### Create a network in container
`docker network create <network_name>`

### Case study
We have successfuly created a volume to store the data of our notes application, but this is not enough, we need to make it easy for it to scale if we need to make an API or expand our application. In this case, we need to make our application run on multiple containers to accomodate the multiple applications running on it. That means we need to connect our database to our front-end. 

### Docker networking to the rescue
#### Create a network
`docker network create todo-app`
#### Start a MySQL container and attach it to the network
```shell
docker run -d \
     --network todo-app --network-alias mysql \
     -v todo-mysql-data:/var/lib/mysql \
     -e MYSQL_ROOT_PASSWORD=secret \
     -e MYSQL_DATABASE=todos \
     mysql:5.7
```
As you can see, we have spinned up a MySQL docker container in detached mode
`--network`: specifies the network name to connect to as todo-app which is the network that we created.
`--network-alias`: specifies the alias of the network* 
`-v`: specifies the volume we should add to the docker container, in this case we create the volume `todo-mysql-data` and mounts it to `var/lib/mysql`
`-e`: This sets the environment variable such in this case being the username and the password.
Lastly we specify the image we want to run.

#### Exec to the MySQL container
`docker exec -it <container_id> mysql -u root -p`

Once we login to the mysql container we can see the database that we created is present but does not have any entities.
#### Connecting our application to mysql
To connect our application to MySQL we can start by adding the [netshoot](https://hub.docker.com/r/nicolaka/netshoot) image to the network by running `docker run -it --network todo-app nicolaka/netshoot`.
We now need to find the ip address of our mysql container so as to connect it with our application. 
When we run the netshoot container, we get a shell session and we can query the ip address of our mysql container using the command `dig mysql`
When done correctly we get the following result

```Shell
; <<>> DiG 9.18.3 <<>> mysql
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 55551
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mysql.				IN	A

;; ANSWER SECTION:
mysql.			600	IN	A	172.18.0.2

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)
;; WHEN: Tue Sep 06 12:04:39 UTC 2022
;; MSG SIZE  rcvd: 44

```
As you can see our query is submitted in form of a question and our an A record is submitted as an answer

Look at a ways to hide env files(see K8secrets, Hashicorp Vault) 

Let us now run our application and see if it works.

``` sh
docker run -dp 3000:3000 \
   -w /app -v "$(pwd):/app" \
   --network todo-app \
   -e MYSQL_HOST=mysql \
   -e MYSQL_USER=root \
   -e MYSQL_PASSWORD=secret \
   -e MYSQL_DB=todos \
   node:12-alpine \
   sh -c "yarn install && yarn run dev"


```
