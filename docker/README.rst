OPENFACE SETUP in DOCKER
========================

This file gives instructions about running OpenFace project on

1. docker with multiple container using docker swarm
2. docker with single container

Once output are generated they are comapred with other OS for
performance testing.

Notation:

* commands executed on the host system are indicated with $
* commands executed on the container are indicated with root11111111#
  , where root<some number> will be the container id.
* the name of the container is `openface`, which can be checked by
  command `docker ps`.

0. INSTALL DOCKER
-----------------

Step 0.1 Install Docker on OSX
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To install docker on OSX follow these steps

1. Download and install docker Toolbox: https://www.docker.com/toolbox

2. check if docker commands are installed in /usr/local/bin::

      $ ls /usr/local/bin/docker*
      
3. Once docker is installed, got to your launch pad and click on
   quickstart docker icon to launch it with the terminal::
      
   NOTE: Henceforth all the commands will be executed on this
   terminal where docker has been started.
   
4. For subsequent steps remember to login to docker if not already::

      $ docker login

5. Test out a simple docker example::

      $ docker run hello-world

6. To compare results the information about the system can be found on
   OSX with::

     system_profiler SPHardwareDataType | fgrep -v UUID | fgrep -v Serial

   You will see something like::


     Hardware:

        Hardware Overview:

          Model Name: MacBook Pro
          Model Identifier: MacBookPro11,3
          Processor Name: Intel Core i7
          Processor Speed: 2.8 GHz
          Number of Processors: 1
          Total Number of Cores: 4
          L2 Cache (per Core): 256 KB
          L3 Cache: 6 MB
          Memory: 16 GB
          Boot ROM Version: MBP112.0138.B17
          SMC Version (system): 2.19f12



   
   
Step 0.2 Install Docker on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TBD in future

Step 0.3 Install Docker on Ubuntu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TBD in future

Step 0.4 Install Docker on Centos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TBD in future

Step 0,5 Use Docker on Chameleon cloud
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Docker can be used as part of the centos image distributed in the
chameleon cloud.

RHEL
^^^^^^^

TBD in future


1.  OpenFace Application: MULTI-SERVER REPLICATION STEPS
--------------------------------------------------------

The next commands should be executed on the terminal on which docker
is launched. These steps will execute openface project on multiple
docker swarm nodes and collect their optputs for graph plots.
      
1. Clone the ansible-cloudmesh-face github respository::
    
        $ mkdir -p ansible-cloudmesh-face
        $ git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
        $ cd ansible-cloudmesh-face/docker/

    To check Dokcer is installed properly::
      
        $ source openface_dep.sh 
  

2. Create the docker swarm cluster with openface containers::
   
        docker$ source openface-multiserver.sh <Number of swarm nodes to be run>

   This command will create required number of nodes in docker swarm
   cluster. In the above command 2nd argument takes number of node
   that you want to run.
   
   Note: Please be aware that in addition to the swarm nodes you
   specified there will always a Master-node and Machine-node created
   to enable the process. The name of the nodes will be::
   
     openface-node<number of the node>

   Master node can be identified as
   `openface-master` and key-store as `openface-machine`.
   
   NOTE: If you get an error saying `openface` container already
   exists or `openface` name has been given to another container, then
   you could kill the existing openface container using commands::
     
     docker-machine rm $(docker-machine ls -q).



3. Container will be created for nodes in the swarm one-by-one. First
   node will create the conatiner and it will pull the bamos/openface
   image. Upon image pull the command prompt will change from `docker $`
   to `root1111111#`, i.e. promt control changes from host to
   container. Once on container change directory to dcoker folder by::

        root1111111# cd /root/openface/docker

4. Verify if the required scripts are present in container::
   
         docker# ls -l  
      

   demo2.sh and demo3.sh should be present in the current directory.      

5. To run Face Comparison demo::
      
       docker# source demo2.sh <Number of times script to be run>
    
   This command will create files `docker_compare_<container-id>.csv`
   and `docker_compare_<container-id>.txt` as output in the current
   directory.
   
   Verify these output files:: 
   
       docker# cat docker_compare_$CID.csv         
       docker# cat docker_compare_$CID.txt

   Note: CID is the id of the container.

6. To run Face Recognition demo::
   
       docker# source demo3.sh <Number of times script to be run>

   This will carete files `docker_classifier_<container-id>.csv` and
   `docker_classifier_<container-id>.txt` as output in the current
   directory.
      
   Verify these output files::
   
       docker# cat docker_classifier_$CID.csv
       docker# cat docker_classifier_$CID.txt

   Note: CID is the id of the container.
  
7. Exit from the container of node1::
  
       docker# exit
  
8. As soon as node1 is exited new container for next node will open
   and it will pull the bamos/openface image. Upon image pull the
   command prompt will change from `docker $` to `root1111111#` and this
   will be repeated for all the nodes in the swarm cluster::

        Repeat step 3 to 7 for all the nodes
   
   
9.  The results from all the containers will be saved in mounted
    folder i.e `/ansible-cloudmesh-face/docker` on host. On host machine
    under docker folder verify the output files generated by multiple
    containers::

        docker$ ls -l

10. Gather csv files for graph plot::
 
        docker$ source gather-csv.sh 

11. Get a pictorial presentation of docker and ubuntu time comparison:: 
 
        cd ../performance
        performance$ Rscript plot_demo2.R
        performance$ Rscript plot_demo3.R

    Graphs are saved by the names:

    * `demo2_real_plot.png`
    * `demo2_sys_plot.png`
    * `demo2_user_plot.png`

    For Demo 3, Face comparison graphs are saved by the names:

    * `demo3_real_plot.png`
    * `demo3_sys_plot.png`
    * `demo3_user_plot.png`

    The files are stored in the `ansible-cloudmesh-face/performance`
    folder.
        


12. The swarm nodes will remain on the host in detached mode.To get
    attached to any of these nodes run following command::
      
        $ eval $(docker-machine env --swarm openface-node<node_number>)
      
    To check the swarm node information::
      
        $ docker-machine ls

13. To kill all the swarm nodes ::
      
        $ docker-machine rm $(docker-machine ls -q)
      
    NOTE: This command will kill all the swarm nodes from the host and
    they have to be recreated if required, using step 2.
    
14. BIG DATA: Test Openface on big dataset (MUCT)::

    Check the MUCT dataset using below commands::

      cd  ansible-cloudmesh-face/docker
      docker# ls –l

    The MUCT folder has `jpg` sub-folder, which has all the jpg images
    unzipped and saved. Run the demos using a big dataset::
 
        source demo2big.sh  <No. of times script to be run>
        source demo3big.sh  <No. of times script to be run> 


1.1 LIMITATIONS
^^^^^^^^^^^^^^^

Docker Swarm instead of pulling private image automatically on all the
swarm nodes simultaneously, performs a one-by-one pull on each swarm
node container.

1.2 BIG DATA
^^^^^^^^^^^^

The current models in openface project are trained with a combination
of the two largest (of August 2015) publicly-available face
recognition datasets based on names: FaceScrub and CASIA-WebFace.

The models can be found under `openface/models` folder which is
downloaded while pulling bamos/openface image::

  nn4.v1
  nn4.v2
  nn4.small1.v1
  nn4.small2.v1

The performance is measured by averaging 500 forward passes with
util/profile-network.lua and the following results use OpenBLAS on an
8 core 3.70 GHz CPU and a Tesla K40 GPU:

+---------------+---------------------+--------------------+
| Model         | Runtime (CPU)       | Runtime (GPU)      |
+---------------+---------------------+--------------------+
| nn4.v1        | 75.67 ms ± 19.97 ms | 21.96 ms ± 6.71 ms |
+---------------+---------------------+--------------------+
| nn4.v2        | 82.74 ms ± 19.96 ms | 20.82 ms ± 6.03 ms |
+---------------+---------------------+--------------------+
| nn4.small1.v1 | 69.58 ms ± 16.17 ms | 15.90 ms ± 5.18 ms |
+---------------+---------------------+--------------------+
| nn4.small2.v1 | 58.9 ms ± 15.36 ms  | 13.72 ms ± 4.64 ms |
+---------------+---------------------+--------------------+


For this project, for majority of the simulations, a subset of images
from the dataset that is already being provided as part of the images
directory of openface installation was utilized for the assessment of
performance of ubuntu and docker runs on multiple VMs.

MUCT (Milborrow / University of Cape Town) dataset: In addition,
images from MUCT database [5] was used for a quick evaluation of the
Ubuntu performance on a single VM. The MUCT database consists of 3755
images from 276 unique subjects. The main motivation for the creation
of the database was to provide more variety than the existing publicly
available landmarked databases — variety in terms of lighting, age,
and ethnicity. The MUCT landmarks are the 68 points defined by the
popular FGnet [3] markup of the XM2VTS database [2], plus four extra
points for each eye. This dataset is available for download via github
at https://github.com/StephenMilborrow/muct.git


2.  OpenFace Application: SINGLE-SERVER REPLICATION STEPS
---------------------------------------------------------

These steps will execute openface project on single docker container
collect optputs for graph plots.


1. Clone the ansible-cloudmesh-face github respository::
    
        $ mkdir -p ansible-cloudmesh-face
        $ git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
        $ cd ansible-cloudmesh-face/docker/

d. To check Dokcer is installed properly::
      
      $ source openface_dep.sh


2. Create the openface container::

        $ source install-openfacedocker.sh

        root1111111# cd /root/openface/docker
     
   This will install all the required dependencies, check if docker is
   installed properly,copy the required scripts from host to
   docker,pull bamos/openface docker hub repositiory and create a
   docker container called `openface`.The prompt will change from
   $docker> to container-ID> .  Once in the container's command-line
   change the directory to `/root/src/openface`.
     
   NOTE : If you get an error saying `openface` container already
   exists or `openface` name has been given to another container, then
   you could kill and remove the existing openface container using
   commands in step:11 for fresh installation OR you could attach to
   this existing container using commands in step:10.
   
3. Verify if the required scripts are present in container::
   
        docker# ls -l  
      
    demo2.sh and demo3.sh should be present in the current directory. 

4. To run Face Comparison demo::
      
        docker# source demo2.sh <Number of times script to be run>

   This command will create files `docker_compare_<container-id>.csv`
   and `docker_compare_<container-id>.txt` as output in the current
   directory.
    
   Verify these output files:: 
   
        docker# cat docker_compare_$CID.csv         
        docker# cat docker_compare_$CID.txt

   Note CID is the id of the container.

5. To run Face Recognotion demo::
   
        docker# source demo3.sh <Number of times script to be run>

   This command will carete files
   `docker_classifier_<container-id>.csv` and
   `docker_classifier_<container-id>.txt` as output in the current
   directory.
      
   Verify these output files::
   
        docker# cat docker_classifier_$CID.csv
        docker# cat docker_classifier_$CID.txt

      Note CID is the id of the container.

6. Exit from the container of node1::
  
        docker# exit

7. On the host verify the CSV files:: 

        docker$ ls -l performance/

   The output files `docker_compare_<container-id>.csv` and
   `docker_classifier_<container-id>.csv` should be present here.
 
8. Gather csv files for graph plot::  

        docker$ source gather-csv.sh 

9. Get a pictorial presentation of docker and ubuntu time comparison::

        cd ../performance
        performance$ Rscript plot_demo2.R
        performance$ Rscript plot_demo3.R

   Graphs are saved by the names:

   * `demo2_real_plot.png`
   * `demo2_sys_plot.png`
   * `demo2_user_plot.png`

   For Demo 3, Face comparison graphs are saved by the names:

   * `demo3_real_plot.png`
   * `demo3_sys_plot.png`
   * `demo3_user_plot.png`

   The files are stored , under `ansible-cloudmesh-face/performance`
   folder.


10. For future use save the container content::

       $ docker commit openface

    You can re-attach an dettached container saved container by:: 
   
       $ docker exec -t -i openface /bin/bash
      

11. To stop the docker container::
      
       $ docker kill openface
       $ docker rm openface

    Warning: This will stop the container permanently and all the
    container content will be deleted.
      
    Verify the container has been closed::
    
       $ docker ps






