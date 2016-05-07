cp docker_compare_*.csv ../performance/

cp docker_classifier_*.csv ../performance/

system_profiler SPHardwareDataType |fgrep -v UUID |fgrep -v Serial >> ../performance/hardware.txt 
