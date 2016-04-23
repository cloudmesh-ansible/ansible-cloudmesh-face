DESCRIPTION
============

Prerequiste 
=============

* Operating Systems: Linux or OSX

* Docker: Follow Docker Mac OSX Installation Guide
  `<https://docs.docker.com/engine/installation/mac/>` to start a
  docker machine and connect your shell to it prior to building the
  container.

Installation 
==============


* For Docker follow the instructions at
  `<https://github.com/cloudmesh/ansible-cloudmesh-face/blob/master/docker/README.rst/>`
* For Ubuntu follow the instructions at
  `<https://github.com/cloudmesh/ansible-cloudmesh-face/blob/master/ubuntu/README.rst/>`
 

Draft Goals
===========

* automated deployment with docker on OSX
* automated deployment on centos
* automated deployment on ubunto

* automated repetable perfomance applications derived form the 3 demos
* performance study of the three frameworks
* comparision of capability of systems while using a standard benchmark as to not 
  only compare performance of algorithms, but actual  capability of machines
* develop unit tests for testing the deployment
* develop unit tests for running the benchmarks

* clouds on which we execute the three benchmarks

   * kilo cloud
   * chameleon cloud
   * cybera cloud (only if kilo and chameleon ar working, test will be replicated by 
     Gregor on cybera to see if approach works on other clouds
   * Azure
   * AWS

Accessing clouds
=================
We assume you create with some script (possibly an enhanced version of cloudmesh client that we work on right now) a number of vms that you will use to deploy the infrastructure

* kilo you should have access to
* chameleon, please register for account and send me your account name so I can add you, Gregor
* cybera, you do not apply for account, I will run your project on it to test reproducability
* AWS, I think students get free hours, please be conservative with your use, so 
  get this one first on kilo and chameleon before going to AWS
* Azure, I am not sure if they offer free hours please lete me know

Preparation and Presentation
============================

The info here will not be a substitute for the presentation that BAdi and Hyungro are asking for. 

INSTALL
========

::
   
   mkdir -p github/cloudmesh
   cd github/cloudmesh
   git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
   cd client
   # make sure you have a virtualenv configured and activated
   # chose your branch and do either
   python setup.py install


REFERNCES
==========

Participants
=============

* Sonal Shrivastava (sshrivas@umail.iu.edu)
* sduvvuru@umail.iu.edu
* Gregor von Laszewski (laszewski@gmail.com)
