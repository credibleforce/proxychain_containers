#!/bin/bash 

SCRIPTNAME="$(basename "$0")"
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
VERSION="0.0.1"

cd $SCRIPT_DIR
IMAGE_NAME=proxychains-$(basename $PWD)
docker build -t $IMAGE_NAME .