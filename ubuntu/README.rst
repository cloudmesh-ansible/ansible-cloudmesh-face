OPENFACE SETUP in UBUNTU
=========================

1. Clone the openface github respository

    ::
    
        git clone –recursive https://github.com/cmusatyalab/openface.git

2. Install Curl

    ::
    
        sudo apt-get update
        sudo apt-get install curl 

2. Setup Docker

    ::

        curl -fsSL https://get.docker.com/ | sh


    If not logged in as root, run the command below ::
    
        sudo usermod -aG docker username 
    
    Verify docker is installed correctly::
    
        docker run hello-world

3. Install OpenCV

    ::

        git clone https://github.com/Itseez/opencv.git 
        cd ~/opencv 
        mkdir release cd release cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local make sudo make install

4. Install boost libraries first 

    ::
        sudo apt-get install libboost-all-dev

5. Install dlib::

        mkdir -p ~/src 
        cd ~/src tar xf dlib-18.16.tar.bz2 
        cd dlib-18.16/python_examples 
        mkdir build 
        cd build 
        cmake ../../tools/python 
        cmake --build . --config Release 
        sudo cp dlib.so /usr/local/lib/python2.7/dist-packages

6. Torch can be installed to your home folder in ~/torch by running these three commands::

    git clone https://github.com/torch/distro.git ~/torch --recursive 
    cd ~/torch; bash install-deps; ./install.sh
    for NAME in dpnn nn optim csvigo cutorch cunn fblualib torchx; do luarocks install $NAME; done

7. On Linux with bash source ~/.bashrc

8. Install python dependencies::
    cd openface
    sudo python2 setup.py install
