A=`docker ps --format "{{.ID}}"`
    
    docker cp $A:/root/src/openface/docker_compare_time.csv ~/Desktop/ansible-cloudmesh-face/performance/docker_compare_time.csv

    docker cp $A:/root/src/openface/docker_classifier_time.csv ~/Desktop/ansible-cloudmesh-face/performance/docker_classifier_time.csv 
