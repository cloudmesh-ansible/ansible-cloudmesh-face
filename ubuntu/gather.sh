
    cp /home/$(whoami)/openface/ubuntu_compare_time.csv ../performance/ubuntu_compare_time.csv

    cp /home/$(whoami)/openface/ubuntu_classifier_time.csv ../performance/ubuntu_classifier_time.csv 

cd ../performance

echo "#Demo2, VirtualBox, Ubuntu"|cat - ubuntu_compare_time.csv > /tmp/out && mv /tmp/out ubuntu_compare_time.csv
echo "#Demo3, VirtualBox, Ubuntu"|cat - ubuntu_classifier_time.csv > /tmp/out && mv /tmp/out ubuntu_classifier_time.csv

