S=`seq 50`
echo "real,user,sys" > ubuntu_classifier_time.csv && (for i in $S; do TIMEFORMAT=%R','%U','%S && time ./demos/classifier.py infer ./models/openface/celeb-classifier.nn4.small2.v1.pkl images/examples/{carell,adams,lennon}* 2>/dev/null; done)>ubuntu_classifier_output.txt  2>> ubuntu_classifier_time.csv
