#!/bin/bash

DB_USER=${DB_USER:="admin"}
DB_PASSWORD=${DB_PASSWORD:="admin"}
IMAGE_NAME="counter-app"
IMAGE_TAG="latest"

if [ -z "$(which docker)" ]; then
    abort "Cannot find docker, please make sure it's installed"
    exit 1
fi

echo "Start app"
docker run --name ${IMAGE_NAME} --network=host --restart=always -d -e DB_USER=${DB_USER} -e DB_PASSWORD=${DB_PASSWORD}  ${IMAGE_NAME}:${IMAGE_TAG}

echo "Prepare db schema"
docker exec -ti ${IMAGE_NAME} python manage.py makemigrations
docker exec -ti ${IMAGE_NAME} python manage.py migrate


