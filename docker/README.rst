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

      Hopefully this can be done via commandline only and no gui tools
      TBD
      $ ???
      $ ???
   
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
    
        $ git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
        $ cd ansible-cloudmesh-face/docker/
               
2. create the openface container::

        broken: $ source install-docker.sh

        why not something like
        
        $ sh install-openface.sh
        
   This will create a container called `openface`
   
3. Verify if things are properly set up::

   do some docker ls or something like this that at least show things exist
   
4. To login to this container use::

      $ TBD

5. To run Face Comparison demo::
    
       openface> source demo2.sh

6. To run Face Recognotion demo::
    
       openface> source demo3.sh

    
