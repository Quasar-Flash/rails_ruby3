#!/bin/sh

docker build -t ruby3 .
docker container run -it ruby3
