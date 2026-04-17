#!/bin/bash

docker stop devops-container || true
docker rm devops-container || true

docker run -d -p 80:80 --name devops-container devops-app
