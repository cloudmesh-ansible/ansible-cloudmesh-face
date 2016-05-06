eval $(docker-machine env)

id=$(which docker)

if [ -x $id ];then
   echo "Docker installed at following location: " $id   
else
   echo "Docker is not installed. Installing  Docker!!!"
  
   brew apt-get update
   brew apt-get install curl
   curl -fsSL https://get.docker.com/ | sh
  
   sudo usermod -aG docker username
   
   echo "Verify docker is installed correctly:"

   docker run hello-world	
	
fi


