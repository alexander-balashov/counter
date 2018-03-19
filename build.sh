#!/bin/bash

IMAGE_NAME="counter-app"
IMAGE_TAG="latest"

if [ -z "$(which docker)" ]; then
    abort "Cannot find docker, please make sure it's installed"
    exit 1
fi

echo "Building Docker image"
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
