#!/bin/bash
#This script install the dependencies for installing the latest R packages in ubuntu

#Install recent libraries
apt-get update  
apt-get install -y libcurl4-openssl-dev  
apt-get install -y libgstreamer-plugins-base0.10-0  
apt-get install -y gdebi-core  
apt-get install -y libapparmor1  
apt-get install -y  libxml2-dev  
apt-get install -y libcurl4-gnutls-dev 


#get an up-to-date version of R
echo 'deb http://cran.cnr.Berkeley.edu/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list  
apt-get update  
apt-get install -y --force-yes r-base r-base-dev 

#Set a default mirror
cat >> /etc/R/Rprofile.site << EOF  
local({  
  # add MASS to the default packages, set a CRAN mirror
  old <- getOption("defaultPackages"); r <- getOption("repos")
  r["CRAN"] <- "http://cran.rstudio.com"
  options(defaultPackages = c(old, "MASS"), repos = r)
})
EOF  


