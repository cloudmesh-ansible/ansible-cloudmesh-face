S=`seq 50`
echo "real,user,sys" > ubuntu_compare_time.csv && \
(for i in $S; do \
TIMEFORMAT=%R','%U','%S && \
time ./demos/compare.py images/examples/{lennon*,clapton*};done)>ubuntu_compare_output.txt  2>> ubuntu_compare_time.csv
