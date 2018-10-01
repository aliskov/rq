#!/bin/bash
########################################
# Put this on a Server
# run chmod +x deploy_app.sh to make the script executable
# 
# Execute this script:  ./deploy_app.sh ariv3ra/python-circleci-docker:$TAG
# Replace the $TAG with the actual Build Tag you want to deploy
#
########################################

set -e

DOCKER_IMAGE=$1
CONAINER_NAME=“realty_quant”

# Check for arguments
if [[ $# -lt 1 ]] ; then
    echo '[ERROR] You must supply a Docker Image to pull'
    exit 1
fi

echo "Deploying Realty Quant to Docker Container"

#Check for running container & stop it before starting a new one
#if [ $(docker inspect -f '{{.State.Running}}' $CONAINER_NAME) = "true" ]; then
#    docker stop realty_quant
#fi

echo "Starting RealtyQuant using Docker Image name: aliskov/rq:latest“

docker run -d --rm=true -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --net rq-net --name realty_quant aliskov/rq:latest

docker ps -a
