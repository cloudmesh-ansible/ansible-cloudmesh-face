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
               
2. create the openface container::

        $ source install-docker.sh             
        cd /root/src/openface
     This will create a container called `openface` and then change the directory to /root/src/openface
   
3. Verify if the required scripts are present in container::
      openface> ls -l  
      
      demo2.sh and demo3.sh should be present in the current directory.

5. To run Face Comparison demo::
    
       openface> source demo2.sh
      This will carete files “docker_compare_time.cv" and  “compare_output.txt" as output in the current directory.
       Verify these output files:
       openface> cat docker_compare_time.cv
       openface> cat compare_output.txt

6. To run Face Recognotion demo::
    
       openface> source demo3.sh
      This will carete files “docker_compare_time.cv" and  “classifier_output.txt" as output in the current directory.
       Verify these output files:
       openface> cat docker_classifier_time.cv
       openface> cat classifier_output.txt

6. Detach from the running container ::

         cntrl p + cntrl q

7. Gather the CSV files for evaluation ::

       $docker>source gather.sh

      This will copy “docker_compare_time.cv” and “docker_classifier_time.cv” from docker container to "ansible-cloudmesh-face/performance” folder to be used for time evaluation.
      
8. To stop the docker container ::

       openface> docker kill openface
      Verify the container has been closed:
       openface> docker ps
      
9. On the host verify the CSV files :: 
        $docker> cd ..
        $ansible-cloudmesh-face> cd performance
        $performance> ls -l
   The output files “docker_compare_time.cv” and “docker_classifier_time.cv” should be present here.
