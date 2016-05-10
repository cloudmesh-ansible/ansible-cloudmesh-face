#!/bin/bash

now=$(date +"%m_%d_%Y")

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

    CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"

    echo "Generating Output ..."

    echo "real,user,sys" > docker_compare_$CID.csv && \
    (for i in `seq $1`; do \
        TIMEFORMAT=%R','%U','%S && \
        time ../demos/compare.py ../images/examples/{lennon*,clapton*}; \
    done) > docker_compare_$CID.txt  2>> docker_compare_$CID.csv

    echo "Output generated for Container: $CID "
    echo
    echo "Outputfiles generated:"
    echo "docker_compare_$CID.txt"
    echo "docker_compare_$CID.csv"
    echo
    cat docker_compare_$CID.csv

fi
