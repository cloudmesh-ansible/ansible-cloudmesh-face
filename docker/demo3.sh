#!/bin/bash

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

    CID="$(cat /proc/self/cgroup | grep "docker" | sed s/\\//\\n/g | tail -n1 | cut -c -12)"

    echo "Generating output ..."

    echo "real,user,sys" > docker_classifier_$CID.csv && \
    (for i in `seq $1`; do \
      TIMEFORMAT=%R','%U','%S && \
      time ../demos/classifier.py infer ../models/openface/celeb-classifier.nn4.small2.v1.pkl ../images/examples/{carell,adams,lennon}* \
    ;done)>docker_classifier_$CID.txt  2>> docker_classifier_$CID.csv

    echo "Output generated for Container: $CID"
    echo
    echo "Outputfiles generated:"
    echo "docker_classifier_$CID.txt"
    echo "docker_classifier_$CID.csv"
    echo
    cat docker_compare_$CID.csv

fi
