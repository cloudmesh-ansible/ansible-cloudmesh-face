#!/bin/bash

id=$(which docker)

if $ [ -d $id ]
echo $id
then
   echo "Docker installed at following location: " $id   
else
   echo "Docker is not installed. Installing  Docker!!!"
  
   brew  update
   brew  install curl
   curl -fsSL https://get.docker.com/ | sh
  
   sudo usermod -aG docker username
   
   echo "Verify docker is installed correctly:"

   docker run hello-world	
	
fi
eval $(docker-machine env)

