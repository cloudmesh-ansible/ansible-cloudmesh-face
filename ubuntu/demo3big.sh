#!/bin/bash

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

cd openface

uid="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)"


echo "real,user,sys" > ubuntu_big_classifier_$uid.csv && \
(for i in `seq $1`; do TIMEFORMAT=%R','%U','%S && \
time ./demos/classifier.py infer ./models/openface/celeb-classifier.nn4.small2.v1.pkl ../muct/data/jpg/*.jpg 2>/dev/null;done)>ubuntu_big_classifier_$uid.txt  2>> ubuntu_big_classifier_$uid.csv

fi

