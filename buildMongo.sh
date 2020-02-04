#!/bin/sh
ADMIN_DB='admin'

docker-compose down &&
 docker-compose rm &&
 docker-compose pull &&
 docker-compose build --no-cache &&
 docker-compose up -d --force-recreate
 sleep 1

echo "Enter admin username"
read ADMIN_USER
echo "Enter admin password"
read ADMIN_PWD
docker exec db_mongodb mongo ${ADMIN_DB} --eval  "db.createUser({user:'${ADMIN_USER}',pwd:'${ADMIN_PWD}',roles:[{role:'userAdminAnyDatabase',db:'${ADMIN_DB}'},{role:'readWrite',db:'${ADMIN_DB}'}]});" &&
echo "Enter database name"
read DB
echo "Enter username"
read DBUSER
echo "Enter password"
read DBPASS
docker exec db_mongodb mongo ${DB} --eval  "db.createUser({user:'${DBUSER}', pwd:'${DBPASS}', roles:[{role:'readWrite',db:'${DB}'}]});" -u ${ADMIN_USER} -p ${ADMIN_PWD} --authenticationDatabase ${ADMIN_DB}
