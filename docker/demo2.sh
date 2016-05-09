#!/bin/bash

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"

echo "Generating Output!!!"

echo "real,user,sys" > docker_compare_$CID.csv && (for i in `seq $1`; do TIMEFORMAT=%R','%U','%S && time ../demos/compare.py ../images/examples/{lennon*,clapton*};
done)>docker_compare_$CID.txt  2>> docker_compare_$CID.csv

echo "Output generated for Container :"$CID" !! Please verify the csv and txt files using ls -l";
fi
