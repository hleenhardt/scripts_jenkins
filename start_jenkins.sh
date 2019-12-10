#! /bin/bash

if [ "$(docker ps -aq -f status=exited -f name=jenkins)" ]; then
        docker start jenkins
else
    docker run \
        -p 8080:8080 \
        -p 50000:50000 \
        -v jenkins_home:/var/jenkins_home \
        --name jenkins \
        jenkins/jenkins:lts 
fi