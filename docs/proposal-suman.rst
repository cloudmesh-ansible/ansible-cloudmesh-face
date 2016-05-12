Project Proposal (In Progress)
===============================================================================

NIST face detection project
-------------------------------------------------------------------------------



Openface Software description
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

* Demo 1: Real time web: This demo does the full face recognition
  pipeline on every frame. In practice, object tracking like
  dlib's should be used once the face recognizer has predicted a face.
* Demo 2: Comparing two images: The comparison demo outputs the
  predicted similarity score of two faces by computing the squared L2
  distance between their representations.
* Demo 3: Classifier demo : OpenFace's core provides a feature
  extraction method to obtain low-dimensional representation of any
  face. demos/classifier.pyshows a demo of how these representations
  can be used to create a face classifier.

Project goals
^^^^^^^^^^^^^

The goal of project is openface software deployment on ubuntu and
docker systems. A sensible performance study delineating the different
frameworks for the various demonstrations that needs to be created for
the face detection software. The performance study will be be
repeatable and in some fashion new results on different machines will
be integrated once they become available The two key steps are:

1. ubuntu deployment (will use ansible): and demo1, demo2, demo3 ( by
   Suman Duvvuru)
2. docker deployment (may use ansible for demos, will use Dockerfiles)
   and demo1, demo2, demo3: (Sonal Srivatsava)



Team
-------------------------------------------------------------------------------

::

  Name: Suman Duvvuru (independent project)
  IU Github Username: sduvvuru
  Personal github username: sduvvuru123
  Portal username: sduvvuru

  Co-team members: 
    Sonal Srivatsava 
    Dr.Gregor von Lazewski (laszewski@gmail.com)


Role
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Deployment: Suman Duvvuru

Artifacts
-------------------------------------------------------------------------------

* Workspace for NIST project
  https://github.com/cloudmesh/ansible-cloudmesh-face
* Create virtual machines with cloudmesh (contributed by Gregor)
* Develop ansible deployment script for ubuntu, possibly expand this to other OS for bonus points
* Develop scripts to run demos:

  * Run demo 1 using dataset and generate output
  * Run demo 2 using dataset and generate output
  * Run demo 3 using dataset and generate output

* Generate a framework to measur performance and compare it bewtween
  different Operating systems (COmparision framework provided by Sonal
  so far, but Suman can contribute or even may have to contribute)
* Generate performance metrics and analysis graphs, while comparing it
  to results done in docker by Sonal.
* A joint report between Sonal and Suman is to be developed. Microsoft
  OneDrive is used for the report which is using the ACM template.


List of Technologies
-------------------------------------------------------------------------------

Development Languages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Python

Software Tools
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Ansible, Docker


Compute Resources
-------------------------------------------------------------------------------

* Ubuntu virtualbox, Chameleon cloud

System Requirements
-------------------------------------------------------------------------------

* OS: Ubuntu 14.04 LTS
* Storage: 500GB

List of DataSets
-------------------------------------------------------------------------------

Image datasets from Openface library at
https://github.com/cmusatyalab/openface 

Schedule
-------------------------------------------------------------------------------

Apr 1 -15: Initial meeting, discussion and project proposal
Apr 7 – Apr 18: Build systems
Apr 19- Apr 25: Develop modules, test run
Final week: Final Report, Review, Submission



Project Style and Type
-------------------------------------------------------------------------------

* Deployment

Acknowledgement
-------------------------------------------------------------------------------

This project idea is obtained from the following sources:

* https://cmusatyalab.github.io/openface/

