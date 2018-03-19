#!/bin/bash

ROOT_PASSWORD=${ROOT_PASSWORD:="qwerty"}
DB_USER=${DB_USER:="admin"}
DB_PASSWORD=${DB_PASSWORD:="admin"}

if [ -z "$(which docker)" ]; then
    abort "Cannot find docker, please make sure it's installed"
    exit 1
fi

docker run --name mysql-db --network=host -e MYSQL_ROOT_PASSWORD="${ROOT_PASSWORD}" -e MYSQL_DATABASE=mydb -e MYSQL_USER="${DB_USER}" -e MYSQL_PASSWORD="${DB_PASSWORD}" --restart=always -d mysql

