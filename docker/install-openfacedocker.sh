echo "Automated Docker build for OpenFace"

    eval $(docker-machine env)

    docker pull bamos/openface

    docker run -p 9000:9000 -p 8000:8000 --name openface -v /Users/Sonal/ansible-cloudmesh-face/docker:/root/src/openface/docker  -ti bamos/openface /bin/bash

    SS=`docker ps --format "{{.Names}}"`
    
    echo "Container Name is:"$SS
    
 
