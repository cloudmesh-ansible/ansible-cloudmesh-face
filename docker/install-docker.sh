#!/bin/bash

clear 


echo "Cloning the openface github respository"

git clone --recursive https://github.com/cmusatyalab/openface.git

echo "Setting up Docker"

echo "Installing Curl" 

    brew update
 
    brew install curl 

echo "Verifying docker is installed correctly"

    eval $(docker-machine env)

    docker run hello-world

echo "Automated Docker build for OpenFace"

    
    docker pull bamos/openface

    docker run -d  -p 9000:9000 -p 8000:8000 --name openface   bamos/openface
    
    SS=`docker ps --format "{{.Names}}"`
    
    echo "Container Name is:"$SS
    
    echo "Copying demo2.sh and demo3.sh"

    docker cp demo2.sh openface:/root/src/openface/demo2.sh

    docker cp demo3.sh openface:/root/src/openface/demo3.sh

    docker exec -t -i openface /bin/bash
 
    cd ~/openface /bin/bash
   
