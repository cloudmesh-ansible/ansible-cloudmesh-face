VM Replication steps
====================

Step 1:  Install Openface
 
* (i) using the ansible script (ubuntu_openface.yml) that using ansible methods to install 
  all the dependencies and the openface software::
  
    ansible-playbook  ubuntu_openface.yml -i inventory.txt -u cc 
      
OR

* (ii) Run the shell script directly on the VMs::
 
    ./openface_ubuntu.install.sh

Step 2: Copy Scripts for running demo2 (demo2b.sh) and demo3 (demo3b.sh) to VMs. 
Once the installation is complete, run a script to copy the demo2, demo3 scripts 
to run on the example data and MUCT data::

     ./democopy.sh

Step 3:  Execute the demo2 and demo 3 for a certain number of iterations on VMs (used N=50) ::

  ./demo2b.sh  N
  ./demo3b.sh  N
  
The results files (ubuntu_compare_uid.csv and ubuntu_classifier_uid.csv ) are being generated

Step 4: Copy the results to the local git directory (ansible-cloudmesh-face/performance folder) for analysis ::

   scp cc@vm-ip:openface/ubuntu* .csv .
 
Repeat this for all VMs

Step 5: Run analysis to generate descriptives and box plots 

 Once the docker files were generated then run the Rscripts to generate 
 3 plots for demo2 and 3 plots for demo3 corresponding to use, real and 
 sys times and further generate the means and SDs for comparison. This 
 script needs to be run from the local directory 
 ((ansible-cloudmesh-face/performance folder) containing all the results csv files::
       
       Rscript demo2_summaryPlots.R
       Rscript demo3_summaryPlots.R
       Rscript demo_mean_sd.R

Step 6: Test Openface on big dataset (MUCT) ::

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


 
