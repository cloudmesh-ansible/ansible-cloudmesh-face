#!/bin/bash

clear 


echo "Cloning the openface github respository"

git clone –recursive https://github.com/cmusatyalab/openface.git

echo "Setting up Docker"

echo "Installing Curl" 

    brew update
 
    brew install curl 

echo "Installing Docker"

    curl -fsSL https://get.docker.com/ | sh


echo "If not logged in as root, add the usename" 

    sudo usermod -aG docker whoami 

echo "Verifying docker is installed correctly"

    docker run hello-world

echo "Automated Docker build for OpenFace"

    eval $(docker-machine env)
    
    docker pull bamos/openface
    
    docker run -w -p 9000:9000 -p 8000:8000 -t -i bamos/openface /bin/bash
    
   
