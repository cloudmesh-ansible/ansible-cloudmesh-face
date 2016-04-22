#!/bin/bash

clear 


echo "Cloning the openface github respository"

git clone --recursive https://github.com/cmusatyalab/openface.git

echo "Setting up Docker"

echo "Installing Curl" 

    brew update
 
    brew install curl 

echo "Verifying docker is installed correctly"

    docker run hello-world

echo "Automated Docker build for OpenFace"

    eval $(docker-machine env)
    
    docker pull bamos/openface

    S=`docker run -d -p 9000:9000 -p 8000:8000 bamos/openface`
    
    SS=`echo $S | cut -c1-12` 
    
    docker cp demo2.sh $SS:/root/src/openface/demo2.sh

    docker cp demo2.sh $SS:/root/src/openface/demo3.sh

    docker exec -t -i $SS /bin/bash
 
    cd ~/root/src/openface /bin/bash
   
