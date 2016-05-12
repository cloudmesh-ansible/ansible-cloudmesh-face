#!/bin/bash

cd openface

if [ -z "$*" ]; then echo "Usage: ./sh <NUMBER OF TIMES SCRIPTS TO BE RUN>";

else

uid="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)"

echo "real,user,sys" > ubuntu_big_compare_$uid.csv && \
(for i in `seq $1`; \
do TIMEFORMAT=%R','%U','%S && \
time demos/compare.py ~/muct/data/jpg/*.jpg;done) > ubuntu_big_compare_$uid.txt  2>> ubuntu_big_compare_$uid.csv

fi
