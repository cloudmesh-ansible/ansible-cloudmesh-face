OpenFace Benchmark
==================

Contributors
------------

* Gregor von Laszewski (laszewski@gmail.com) (Project Lead)
* Sonal Shrivastava (sshrivas@umail.iu.edu)
* Suman Duvvuru (sduvvuru@umail.iu.edu)
* Fugang Wang (kevinwangfg@gmail.com)

Openface Software description
------------------------------

OpenFace is a Python and Torch implementation of face recognition with
deep neural networks and is based on the CVPR 2015 paper FaceNet: A
Unified Embedding for Face Recognition and Clustering by Florian
Schroff, Dmitry Kalenichenko, and James Philbin at Google. The
Openface software workflow involves the following steps:

1. Detect faces with a pre-trained models from dlib or OpenCV.
2. Transform the face for the neural network. This repository uses
   dlib's real-time pose estimation with OpenCV's affine
   transformation to try to make the eyes and bottom lip appear in the
   same location on each image.
3. Use a deep neural network to represent (or embed) the face on a
   128-dimensional unit hypersphere.
4. Applies clustering or classification techniques to the features to
   complete the recognition task.

There are different demonstrations that are done by software:

* Demo 1. Real time web: This demo does the full face recognition
  pipeline on every frame. In practice, object tracking like
  dlib's should be used once the face recognizer has predicted a face.
* Demo 2. Comparing two images: The comparison demo outputs the
  predicted similarity score of two faces by computing the squared L2
  distance between their representations.
* Demo 3. Classifier demo : OpenFace's core provides a feature
  extraction method to obtain low-dimensional representation of any
  face. demos/classifier.pyshows a demo of how these representations
  can be used to create a face classifier.

The goal of project is openface software deployment on ubuntu and
docker systems. A sensible performance study delineating the different
frameworks for the various demonstrations that needs to be created for
the face detection software. The performance study will be be
repeatable and in some fashion new results on different machines will
be integrated once they become available The two key steps are:

1. docker deployment (may use ansible for demos, will use Dockerfiles)
   and demo2, demo3: (Sonal Srivatsava, modifications to the demo
   files and the README conducted by Gregor von Laszewski)
2. ubuntu deployment (will use ansible): and demo2, demo3 ( by Suman Duvvuru)


Prerequiste 
-----------

* Operating Systems: Linux or OSX

* Docker: Follow Docker Mac OSX Installation Guide
  `<https://docs.docker.com/engine/installation/mac/>` to start a
  docker machine and connect your shell to it prior to building the
  container.

Installation
-------------


* For Docker follow the instructions at
  https://github.com/cloudmesh/ansible-cloudmesh-face/blob/master/docker/README.rst/
* For Ubuntu follow the instructions at
  https://github.com/cloudmesh/ansible-cloudmesh-face/blob/master/ubuntu/README.rst/
 

Goals
-----

* automated deployment with docker on OSX
* automated deployment on ubuntu

* automated repetable performance applications derived form the 2 demos
* performance study of the frameworks
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
----------------

We assume you create with some script (possibly an enhanced version of cloudmesh client that we work on right now) a number of vms that you will use to deploy the infrastructure

* kilo you should have access to
* chameleon, please register for account and send me your account name
  so I can add you, Gregor
* cybera, you do not apply for account, I will run your project on it
  to test reproducability
* AWS, I think students get free hours, please be conservative with
  your use, so get this one first on kilo and chameleon before going
  to AWS
* Azure, I am not sure if they offer free hours please lete me know

INSTALL
-------

::
   
   mkdir -p github/cloudmesh
   cd github/cloudmesh
   git clone https://github.com/cloudmesh/ansible-cloudmesh-face.git
   cd client
   # make sure you have a virtualenv configured and activated
   # chose your branch and do either
   python setup.py install


Refernces
---------

* https://cmusatyalab.github.io/openface/


