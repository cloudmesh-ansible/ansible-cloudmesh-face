Insatlation
===========

Please, download the code as follows and change to the appropriate directory:

    git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
    cd ansible-cloudmesh-face/ubuntu


Step 1: Create 3 vms
--------------------

First, we assume that you have 3 virtual machines started on a cloud. To
simplify the setup we have provided a cloudmesh script that does this and
also creates an inventory file that can be used for the ansible script.
Please change the cloud `cm` in the script to the cloud you like to use.
You execute this script after you have installed cloudmesh_client::

    cm boot-vms.cm

This will create the file `inventory.txt` that will be used by ansible

It is advisable to ping the VMs wth ansible::

    ansible all -i inventory.txt -m ping -u cc

You should see that all listed vms return::

   "ping": "pong"

If this is not the case please make sure to remove faulty vms and add
new once so you have 3 vms.

Step 2:  Install Openface with Ansible
--------------------------------------

Using the ansible script `ubuntu_openface.yml` we can now install all needed software into the VMs.

2:50

    ansible-playbook  ubuntu_openface.yml -i inventory.txt -u cc

This procees while take some time.


TODO: no mentioning how long this process will take
TODO: how can we debug/verbose look at the install

TODO:  [WARNING]: While constructing a mapping from /Users/big/github/cloudmesh-new/ansible-cloudmesh-face/ubuntu/ubuntu_openface.yml, line 57, column 5, found a duplicate dict key (file).  Using
last defined value only.

 [WARNING]: While constructing a mapping from /Users/big/github/cloudmesh-new/ansible-cloudmesh-face/ubuntu/ubuntu_openface.yml, line 61, column 5, found a duplicate dict key (shell).  Using
last defined value only.

 [WARNING]: While constructing a mapping from /Users/big/github/cloudmesh-new/ansible-cloudmesh-face/ubuntu/ubuntu_openface.yml, line 71, column 5, found a duplicate dict key (shell).  Using
last defined value only.

 [WARNING]: While constructing a mapping from /Users/big/github/cloudmesh-new/ansible-cloudmesh-face/ubuntu/ubuntu_openface.yml, line 83, column 5, found a duplicate dict key (shell).  Using
last defined value only.


Step 2: Prepare Demos
---------------------

TODO: not properly working as script needs to be modified with
      ips to which the data needs to be copied.
TODO: democopy should read form inventory.txt

Copy Scripts for running demo2 (demo2b.sh) and demo3 (demo3b.sh) to
VMs.  Once the installation is complete, run a script to copy the
demo2, demo3 scripts to run on the example data and MUCT data::

   sh ./democopy.sh

    scp demo2b.sh username@vm-ip:^
    scp demo3b.sh username@vm-ip;^
    scp demo2big.sh username@vm-ip:^
    scp demo3big.sh username@vm-ip:^

Step 3:  Execute the demos
--------------------------

TODO: does not mention to run this in VM, should be able to run in local machine

Execute the demo2 and demo 3 for a certain number of iterations on VMs
(used N=50) ::

    ./demo2b.sh  N
    ./demo3b.sh  N
  
The results files (ubuntu_compare_uid.csv and
ubuntu_classifier_uid.csv ) are being generated

Step 4: Copy the results
------------------------

TODO: this step should be done automatically

Copy the results to the local git directory at::
   
     ansible-cloudmesh-face/performance

for analysis::

     scp cc@vm-ip:openface/ubuntu* .csv .
     Repeat this for all VMs

Step 5: Run the analysis
------------------------

TODO: this script does not take into account that other OS and machines
should be compared ina dynamic fashion

Next you can run the analysis to generate descriptives and box
plots. Once the files were generated then run the Rscripts to generate
3 plots for demo2 and 3 plots for demo3 corresponding to use,real and
sys times and further generate the means and SDs for comparison. This
script needs to be run from the local directory
((ansible-cloudmesh-face/performance folder) containing all the
results csv files::
       
       Rscript demo2_summaryPlots.R
       Rscript demo3_summaryPlots.R
       Rscript demo_mean_sd.R

Step 6: Use bigger dataset
--------------------------

TODO: this shuld be integrated in another ansible script

Test Openface on big dataset (MUCT) ::

 - Download the MUCT dataset via git
        ssh cc@vm-ip
        git clone https://github.com/StephenMilborrow/muct.git 

 - Run the demos using a big dataset
        ./demo2big.sh N
        ./demo3big.sh N

Script locations ::

 -YML and inventory file
        cloudmesh-ansible-face/ubuntu/ubuntu_openface.yml
        cloudmesh-ansible-face/ubuntu/inventory.yml

 -Demos running scripts using sample data from openface installation
        Demo2: cloudmesh-ansible-face/ubuntu/demo2b.sh
        Demo3: cloudmesh-ansible-face/ubuntu/demo3b.sh
        Copy: cloudmesh-ansible-face/ubuntu/democopy.sh

 -Demos running scripts using publicly available MUCT data
        Demo2: cloudmesh-ansible-face/ubuntu/demo2big.sh
        Demo3: cloudmesh-ansible-face/ubuntu/demo3big.sh

 -Analysis Scripts
        cloudmesh-ansible-face/performace/summaryPlots_demo2.R
        cloudmesh-ansible-face/performace/summaryPlots_demo3.R
        cloudmesh-ansible-face/performace/demos_mean_sd.R

OPENFACE INSTALLATION OVERVIEW
==============================

Documentation of the script `ubuntu_openface_install.sh`

Cloning the openface github repository::

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
 
Installing OpenCV :: 

  git clone https://github.com/Itseez/opencv.git
  cd ~/opencv
  mkdir release cd release cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local
  make
  sudo make install
  sudo apt-get -y install python-opencv

Installing Torch to your home folder in ~/torch::

    git clone https://github.com/torch/distro.git ~/torch --recursive

    cd ~/torch; bash install-deps;
    yes | ./install.sh

On Linux with bash::

    source ~/.bashrc

    for NAME in dpnn nn optim optnet csvigo cutorch cunn fblualib torchx; do luarocks install $NAME; done

Installing openface::

     cd openface
     sudo python2 setup.py install
     models/get-models.sh
 
NOW JUNK
Step 1.b: Shell script
^^^^^^^^^^^^^^^^^^^^^^

TODO: DOES NOT WORK

This is an alternative install to the ansible script using just a
shell script and installs directly into the VM. If you have done the
ansible install, you can skip this step::

    cd ~/ansible-cloudmesh-face/ubuntu
    ./openface_ubuntu_install.sh

NOW JUNK: Step 0.1: Instalation on ubuntu server 14.0.4
----------------------------------------------

::

    sudo apt-get install git -y
    git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
    cd ansible-cloudmesh-face/

    wget --no-check-certificate https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
    tar -xzf Python-2.7.11.tgz
    cd Python-2.7.11
    ./configure
    make
    sudo make install

logout and login to activate the new python version.