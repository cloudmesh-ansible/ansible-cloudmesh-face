#!/bin/bash

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"#!/bin/bash

echo "Generating Output!!!

"echo "real,user,sys" > docker_big_compare_$CID.csv && \
(for i in `seq $1`; do \
    TIMEFORMAT=%R','%U','%S && \
    time demos/compare.py ~/muct/data/jpg/*.jpg;done) > docker_big_compare_$CID.txt  2>> docker_big_compare_$CID.csv
fi
