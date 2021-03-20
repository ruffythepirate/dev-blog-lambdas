#!/bin/bash

# For this script to run, you need to have set $AWS_ACCOUNT_ID and $AWS_REGION as environment variables. I recommend doing this in your ~/.bashrc, ~/.zshrc

IMAGE_NAME="dev-blog/persist-metrics-lambda"
IMAGE_VERSION=`cat package.json | jq -r '.version'`
REMOTE_FULL_NAME="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME:latest"

docker tag $IMAGE_NAME:$IMAGE_VERSION $REMOTE_FULL_NAME

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker push $REMOTE_FULL_NAME
