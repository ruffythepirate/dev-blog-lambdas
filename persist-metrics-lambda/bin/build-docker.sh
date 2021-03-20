#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
IMAGE_NAME="dev-blog/persist-metrics-lambda"
IMAGE_VERSION=`cat package.json | jq -r '.version'`

cd $SCRIPT_DIR/..
docker build -t $IMAGE_NAME:$IMAGE_VERSION -t $IMAGE_NAME:latest .
