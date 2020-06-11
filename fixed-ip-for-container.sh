docker network create --gateway 172.19.0.1 --subnet 172.19.0.0/24 frontend
###
# docker-compose.yml for mysql with fixed ip
version: '3.5'

networks:
  frontend:
    external:
      name: frontend

    ipam:
      config:
        - subnet: 172.19.0.0/24

services:
  mysql-development:
    image: mysql:5.7.26
    environment:
      MYSQL_ROOT_PASSWORD: dbpass
      MYSQL_DATABASE: db
#    ports:
#      - "3306:3306"
    networks:
      frontend:
        ipv4_address: 172.19.0.3
