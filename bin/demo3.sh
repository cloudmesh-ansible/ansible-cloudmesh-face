mkdir -p classify-test/raw/{lennon,clapton}
cp images/examples/lennon-* classify-test/raw/lennon
cp images/examples/clapton-* classify-test/raw/clapton
./util/align-dlib.py classify-test/raw align outerEyesAndNose classify-test/aligned --size 96
./batch-represent/main.lua -outDir classify-test/features -data classify-test/aligned
...
nImgs:  4
Represent: 4/4
