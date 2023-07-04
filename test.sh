#!/bin/bash

SCRIPTNAME="$(basename "$0")"
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
VERSION="0.0.1"

cd $SCRIPT_DIR

# stop torproxy as required
if docker ps -a | grep torproxy > /dev/null 2>&1; then
    docker stop torproxy
    docker rm torproxy
fi

# start tor proxy
docker run -d --rm --name torproxy -p 9050:9050 dperson/torproxy

# get the tor proxy ip
TORPROXY=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' torproxy)

# start aws and pass tor proxy address
aws-cli/build.sh
# docker run --rm --name proxychains-aws-cli -e TORPROXY=$TORPROXY -v "$HOME/.aws":"/root/.aws" proxychains-aws-cli aws sts get-caller-identity

# glcoud
# https://github.com/google-github-actions/auth
gcloud-cli/build.sh
# docker run -e TORPROXY=ip_address_of_torproxy -e GOOGLE_APPLICATION_CREDENTIALS=/path/to/creds.json -v /local/path/to/creds.json:/path/to/creds.json gcloud-tor command

# azure
# create azure creds: https://github.com/marketplace/actions/azure-cli-action
azure-cli/build.sh
# docker run -e TORPROXY=ip_address_of_torproxy -e GOOGLE_APPLICATION_CREDENTIALS=/path/to/creds.json -v /local/path/to/creds.json:/path/to/creds.json gcloud-tor command

# scoutsuite-aws
scoutsuite-aws/build.sh

# scoutsuite-azure
scoutsuite-azure/build.sh

# scoutsuite-gcloud
scoutsuite-gcloud/build.sh
# docker run -e TORPROXY=ip_address_of_torproxy -e GOOGLE_APPLICATION_CREDENTIALS=/path/to/creds.json -v /local/path/to/creds.json:/path/to/creds.json gcloud-tor command
# docker run --rm --name proxychains-scoutsuite-gcloud -e TORPROXY=$TORPROXY proxychains-scoutsuite-gcloud 

# hydra
hydra/build.sh
# docker run --rm --name proxychains-hydra -e TORPROXY=$TORPROXY proxychains-hydra

# python
python/build.sh
# docker run --rm --name proxychains-python -e TORPROXY=$TORPROXY proxychains-python

