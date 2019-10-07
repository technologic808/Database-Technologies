# Download container for mysql

sudo docker pull mysql

# Initialize container with the latest version of mysql

sudo docker run --name docker-mysql -e MYSQL_ROOT_PASSWORD=cdacacts -d mysql:latest

# Open shell inside the docker container

sudo docker exec -it docker-mysql bash

# Connect to MySQL with root and password

mysql -u root -pcdacacts

# VOILA! you are connected to mysql