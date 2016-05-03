S=$2
CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"

echo "Output generated for Container :"$CID" !! Please verify the csv and txt files using ls -l"

echo "real,user,sys" > docker_classifier_$CID.csv && (for i in $S; do TIMEFORMAT=%R','%U','%S && time ./demos/classifier.py infer ./models/openface/celeb-classifier.nn4.small2.v1.pkl images/examples/{carell,adams,lennon}* ;done)>docker_classifier_$CID.txt  2>> docker_classifier_$CID.csv
