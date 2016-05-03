S=$2
CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"
echo "Output generated for Container :"$CID" !! Please verify the csv and txt files using ls -l"

echo "real,user,sys" > docker_compare_$CID.csv && (for i in $S; do TIMEFORMAT=%R','%U','%S && time ./demos/compare.py images/examples/{lennon*,clapton*};done)>docker_compare_$CID.txt  2>> docker_compare_$CID.csv
