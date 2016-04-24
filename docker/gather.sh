A=`docker ps --format "{{.ID}}"`

    docker cp $A:/root/src/openface/docker_compare_time.csv ../performance/docker_compare_time.csv

    docker cp $A:/root/src/openface/docker_classifier_time.csv ../performance/docker_classifier_time.csv 

cd ../performance
S=`system_profiler SPSoftwareDataType | fgrep "Computer Name"`

echo "#Demo2, VirtualBox, Docker",$S|cat - docker_compare_time.csv > /tmp/out && mv /tmp/out docker_compare_time.csv
echo "#Demo3, VirtualBox, Docker",$S|cat - docker_classifier_time.csv > /tmp/out && mv /tmp/out docker_classifier_time.csv

