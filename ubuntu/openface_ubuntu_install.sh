#!/bin/bash

clear 


echo "Cloning the openface github respository"

git clone --recursive https://github.com/cmusatyalab/openface.git

echo "Installing dependencies first"

    sudo apt-get -y install python-pip
    sudo apt-get -y install python-numpy python-scipy
    sudo pip install -U scikit-learn
    sudo pip install bottleneck
    sudo apt-get -y install python-numexpr
    sudo pip install pandas
    sudo pip install dlib
    sudo apt-get -y install libboost-all-dev

echo "Installing OpenCV" 

    git clone https://github.com/Itseez/opencv.git
    cd ~/opencv
    mkdir release cd release cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local
    make
    sudo make install
    sudo apt-get -y install python-opencv

echo "Installing Torch to your home folder in ~/torch"

    git clone https://github.com/torch/distro.git ~/torch --recursive 

    cd ~/torch; bash install-deps; 
    yes | ./install.sh

    # On Linux with bash 
      source ~/.bashrc
      
      for NAME in dpnn nn optim optnet csvigo cutorch cunn fblualib torchx; do luarocks install $NAME; done


echo "Installing openface"
        
	cd openface
    sudo python2 setup.py install
    models/get-models.sh
