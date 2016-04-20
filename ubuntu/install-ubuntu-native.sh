#!/bin/bash

clear 


echo "Cloning the openface github respository"

git clone –recursive https://github.com/cmusatyalab/openface.git

echo "Installing dependencies first"

sudo apt-get install python-numpy python-scipy
sudo pip install -U scikit-learn

sudo pip install bottleneck
sudo apt-get install python-numexpr
sudo pip install pandas



echo "Installing OpenCV" 

        git clone https://github.com/Itseez/opencv.git 

        cd ~/opencv 

        mkdir release cd release cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local 

	make 

	sudo make install


	sudo apt-get install python-opencv

echo "Installing dlib"

    #Install boost libraries first 
        sudo apt-get install libboost-all-dev

        mkdir -p ~/src 

        cd ~/src tar xf dlib-18.16.tar.bz2 

        cd dlib-18.16/python_examples 

        mkdir build 

        cd build 

        cmake ../../tools/python 

        cmake --build . --config Release 

        sudo cp dlib.so /usr/local/lib/python2.7/dist-packages

echo "Installing Torch to your home folder in ~/torch"

    git clone https://github.com/torch/distro.git ~/torch --recursive 

    cd ~/torch; bash install-deps; 

     ./install.sh

    # On Linux with bash 
      source ~/.bashr

echo "Installing openface"
        
	cd openface
	
	sudo python2 setup.py install

	models/get-models.sh
