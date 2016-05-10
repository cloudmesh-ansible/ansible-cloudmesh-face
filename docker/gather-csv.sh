#! /bin/sh

HOST=`hostname`

cp results/*.csv ../performance/

system_profiler SPHardwareDataType |fgrep -v UUID |fgrep -v Serial >> ../performance/hardware_$HOST.txt
