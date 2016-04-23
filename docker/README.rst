OPENFACE SETUP in DOCKER
=========================

Notation:

* commands executed on the host system are indicated with $
* commands executed on the container are indicated with openface>
* the name of the container is `openface`

1. Install docker
-----------------

OSX
^^^

To install docker on OSX follow these steps

a. Download and install docker Toolbox: https://www.docker.com/toolbox

b. check if docker commands are installed in /usr/local/bin::

      $ ls /usr/local/bin/docker*
   
c. For subsequent steps remember to login to docker::   

      $ docker login

d. Test out a simple docker example::

      $ docker run hello-world
   
Windows
^^^^^^^^

TBD in future

Ubuntu
^^^^^^^

TBD in future

Centos
^^^^^^^

TBD in future

RHEL
^^^^^^^

TBD in future

2. OpenFace Application
-----------------------

1. Clone the ansible-cloudmesh-face github respository::
    
        mkdir -p ansible-cloudmesh-face
        $ git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
        $ cd ansible-cloudmesh-face/docker/

2. Create the openface container::
      This will install all the required dependencies, check if docker is installed properly,copy the required scripts from host to
      docker,pull bamos/openface docker hub repositiory and create a docker container called `openface`.The prompt will change from
      $docker> to container-ID> .  Once in the container's command-line change the directory to /root/src/openface.

        $ source install-docker.sh 

        openface> cd /root/src/openface
     
   
3. Verify if the required scripts are present in container::
      demo2.sh and demo3.sh should be present in the current directory.
         openface> ls -l  
      
     

4. To run Face Comparison demo::
      This will carete files “docker_compare_time.csv" and  “compare_output.txt" as output in the current directory.
       openface> source demo2.sh
    
      Verify these output files:
       openface> cat docker_compare_time.cv
      
       openface> cat compare_output.txt

5. To run Face Recognotion demo::
      This will carete files “docker_compare_time.csv" and  “classifier_output.txt" as output in the current directory.
       openface> source demo3.sh
      
      Verify these output files:
       openface> cat docker_classifier_time.cv

       openface> cat classifier_output.txt

6. Detach from the running container ::
      Once the demo2.sh and demo3.sh output files from step 5 are verfied and you are ready for performance evaluation.
      Detach the container from your command line and let it be running on the backgroud using the command:
         cntrl p + cntrl q

7. Gather the CSV files for evaluation ::
      In the host following command will gather all the csv created in docker conatiner to "ansible-cloudmesh-face/performance” folder to
      be used for time evaluation.
      
       $docker>source gather.sh

8. On the host verify the CSV files :: 
        $docker> cd ..

        $ansible-cloudmesh-face> cd performance

        $performance> ls -l
   The output files “docker_compare_time.cv” and “docker_classifier_time.cv” should be present here.

9. For future use save the container content:

       $ docker commit openface

   You can re-attach the saved container by : 
       $ docker exec -t -i openface /bin/bash
      OR
       $ docker start openface
       $ docker attach openface
      
10. To stop the docker container ::
     Warning:  This will stop the container permanently and all the container content will be deleted.
      
       openface> docker kill openface
      
     Verify the container has been closed:
       openface> docker ps


