#!/bin/bash

now=$(date +"%m_%d_%Y_%H_%M_%S")

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

    echo "Generating Output ..."

    CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"

    NAME="$HOST""_""$now""_""$CID"
    echo "Date: $now"
    echo "Host: $HOST"
    echo "ID:   $NAME"

    echo "real,user,sys" > results/docker_compare_$NAME.csv && \
    (for i in `seq $1`; do \
        TIMEFORMAT=%R','%U','%S && \
        time ../demos/compare.py ../images/examples/{lennon*,clapton*}; \
    done) > results/docker_compare_$NAME.txt  2>> results/docker_compare_$NAME.csv

    echo "Output generated for Container: $NAME "
    echo
    echo "Outputfiles generated:"
    echo "results/docker_compare_$NAME.txt"
    echo "results/docker_compare_$NAME.csv"
    echo
    cat results/docker_compare_$NAME.csv

fi
