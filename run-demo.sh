#!/bin/bash

# Author: Chris Wood
# Description: Run the API Transformer demo container

# Run the Docker container
docker run -d -p 8080:8080 -v $PWD/python:/var/git/demo_repo \
--name jenkins docker.io/sensiblewood/blogreferences:transformer-demo

# END. Share and enjoy