#OPENFACE SETUP in UBUNTU

#Clone the openface github respository
git clone –recursive https://github.com/cmusatyalab/openface.git

#Setup Docker

#Install curl
|sudo apt-get update
|sudo apt-get install curl 
|curl -fsSL https://get.docker.com/ | sh

#If not logged in as root, run the command below
sudo usermod -aG docker username
#Verify docker is installed correctly.
docker run hello-world

# Install OpenCV
git clone https://github.com/Itseez/opencv.git
cd ~/opencv
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local 
make
sudo make install

#Install dlib

#Install boost libraries first
sudo apt-get install libboost-all-dev
mkdir -p ~/src
cd ~/src
tar xf dlib-18.16.tar.bz2
cd dlib-18.16/python_examples
mkdir build
cd build
cmake ../../tools/python
cmake --build . --config Release
sudo cp dlib.so /usr/local/lib/python2.7/dist-packages

#Torch can be installed to your home folder in ~/torch by running these three commands:

git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; bash install-deps;
./install.sh

# On Linux with bash
source ~/.bashrc
 
