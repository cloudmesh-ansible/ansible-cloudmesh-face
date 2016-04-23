A=`docker ps --format "{{.ID}}"`
    
    docker cp $A:/root/src/openface/docker_compare_time.csv ../performance/docker_compare_time.csv

    docker cp $A:/root/src/openface/docker_classifier_time.csv ../performance/docker_classifier_time.csv 
