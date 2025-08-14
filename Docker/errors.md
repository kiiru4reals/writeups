### Webpage not showing after connection
Build the application image again. Then exec to the mysql container and run the following commands.
```SQL
ALTER user 'root' identified with mysql_native_password by 'secret';
FLUSH PRIVILEGES;
```

### Permissions issue when deploying laravel application
Run the docker-compose file as root

### Dockerizing Laravel 5.6 applications
Use this [repository](https://github.com/aschmelyun/docker-compose-laravel.git) as a guide. 