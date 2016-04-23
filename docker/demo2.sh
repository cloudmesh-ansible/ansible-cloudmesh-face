S=`seq 50`
echo "real,user,sys" > docker_compare_time.csv && (for i in $S; do TIMEFORMAT=%R','%U','%S && time ./demos/compare.py images/examples/{lennon*,clapton*};done)>compare_output.txt  2>> docker_compare_time.csv
