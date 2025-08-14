### Prerequisites
Before we begin, we have to ensure that we have the following installed:
1. Docker compose
### Process
1. Create a new direcory in and `cd` into it. 
2. Once we do that, we need to create our Dockerfile and add the following
```Dockerfile
FROM python:3
ENV PYTHONDONTWRITEBYCODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
```
This code basically gives the instructions that we should use the python3 parent image, create a directory called code and move our requirements.txt file to the code directory install out requirements and copy all our content to the code directory.
3. We then create our `requirements.txt` file and add the following:
```txt
Django>=3.0,<4.0
psycopg2>=2.8
```
4. We then create our `docker-compose.yaml` file and add the following
```YAML
version: "3.9"
services:
	db:
		image: postgres
		volumes:
			- POSTGRES_DB=postgres
			- POSTGRES_USER=postgres
			- POSTGRES_PASSWORD=postgres
	web:
		build:
		command: python manage.py runserver 0.0.0.0:8000
		volumes:
			- .:/code
		ports:
			- 8000:8000
		environment:
			- POSTGRES_NAME=postgres
			- POSTGRES_USER=postgres
			- POSTGRES_PASSWORD=postgres
		depends_on:
			- db
```
5. We can now create our djanog project on docker by doing the following command `sudo docker-compose run web django-admin startproject <project_name> .`. It is important to note that the `django-admin` files that are created are owned by root, we can do the following to change ownership `sudo chown -R $USER:$USER <project_name> manage.py`
6. We then need to 