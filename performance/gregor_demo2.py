#! /usr/bin/env python


"""Usage: gregor_demo.py --os=OS --host=HOST

Arguments:
  HOST     Host name
  OS OS name
Options:
  -h --help
  -o       OS
"""
from __future__ import print_function

from docopt import docopt
import glob
from cloudmesh_client.common.hostlist import Parameter
import os.path
import textwrap

if __name__ == '__main__':
    arguments = docopt(__doc__)
    print(arguments)

    kinds = ['classifier', 'compare']

    hosts = Parameter.expand(arguments["--host"])
    oses = Parameter.expand(arguments["--os"])

    print (hosts)
    print (oses)

    #
    # CLEAN
    #
    for host in hosts:
        for osystem in oses:
            for kind in kinds:
                data = {
                    "os": osystem,
                    "host": host,
                    "kind": kind
                }

                name = "{os}_{kind}_{host}.csv".format(**data)
                if os.path.isfile(name):
                    os.remove(name)
                    print ("delete", name)
    for host in hosts:
        for osystem in oses:
            for kind in kinds:
                data = {
                    "os": osystem,
                    "host": host,
                    "kind": kind
                }
                data["name"] = "{os}_{kind}_{host}".format(**data)
                pattern = "{name}_*.csv".format(**data)
                files = glob.glob(pattern)
                if files != []:
                    r = ["real,user,sys\n"]

                    for f in files:
                        with open(f) as f:
                            lines = f.readlines()[1:]
                        r = r + lines

                    print ("Merge Files -> {name}.csv\n".format(**data))
                    for f in files:
                        print ('  ', f)
                    print()
                    with open("{name}.csv".format(**data), 'w') as f:
                        f.write(''.join(r))

'''

args<-commandArgs(TRUE)

print (args)

summaryPlots <- function()
{

	#Check for required R packages otherwise install them
	if("ggplot2" %in% rownames(installed.packages()) == FALSE) {
		install.packages("ggplot2",repos="http://cran.rstudio.com/")
	}
	if("tidyr" %in% rownames(installed.packages()) == FALSE) {
		install.packages("tidyr",repos="http://cran.rstudio.com/")
	}

#load packages
library(ggplot2)
library(tidyr)

ufiles=list.files(path=".", pattern="^ubuntu_compare.*csv$")
dfiles=list.files(path=".", pattern="^docker_compare.*csv$")

print (ufiles)
print (dfiles)



#
# concatenate all files from the same host
#
# type = compare or classifier
# host = host

os_cat = function(name){
  system(sprintf("cat %s", name))
}

csv_merge = function(os, type, host){

  name = sprintf("%s_%s_%s", os, type, host)
  filename = sprintf("%s.csv", name)
  
  print(sprintf ("NNN %s", name))
  pattern = paste("^", name, ".*csv$", sep="")
  
  files=list.files(path=".", pattern=pattern)
  print(files)

  system (sprintf("echo 'real,user,sys' > %s", filename))
  os_cat(filename)
  
  for (file in files)
  {
      print ("concatenate")
      print 
      system(sprintf("tail -1 %s >> %s.csv", file, name))
  }
  system(sprintf("cat %s.csv", name))
}
#temp_dataset <-read.csv(file, header=TRUE)
#        f1 <- rbind.data.frame(f1, temp_dataset)
#        rm(temp_dataset)
#  
#        }
#  }
#  return (f1)
#}


d = csv_merge("docker", "classifier", "big")
print (d)


# 
# for (file in dfiles){
#        
#   # if the merged dataset doesn't exist, create it
#   if (!exists("f2")){
#     f2 <- read.csv(file)
#   }
#   else
#   # if the merged dataset does exist, append to it
#   if (exists("f2")){
#     temp_dataset <-read.csv(file)
#     f2 <- rbind.data.frame(f2, temp_dataset)
#     rm(temp_dataset)
#   }
# }
# 
# f1=gather(f1)
# f2=gather(f2)
# 
# f1$OS="Ubuntu"
# f2$OS="Docker"
# 
# f12=rbind(f1,f2)
# 
# # Ubuntu vs Docker Plots
# 
# library(ggplot2)
# 
# # Real time plot
# 
# p <- ggplot(f12[f12$key=="real",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="REAL (Wall Clock) time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
# p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)
# 
# p <- p +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#     panel.grid.major = element_blank(),
#     panel.grid.minor = element_blank(),
#     panel.background = element_blank(),
# 	legend.position="none") 
# 
# ggsave("demo2_real_plot.png")
# 
# # Sys time plot
# 
# p <- ggplot(f12[f12$key=="sys",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="SYS time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
# p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)
# 
# p <- p +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#     panel.grid.major = element_blank(),
#     panel.grid.minor = element_blank(),
#     panel.background = element_blank(),
# 	legend.position="none") 
# 
# ggsave("demo2_sys_plot.png")
# 
# # User time plot
# 
# p <- ggplot(f12[f12$key=="user",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="USER time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
# p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)
# 
# p <- p +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#     panel.grid.major = element_blank(),
#     panel.grid.minor = element_blank(),
#     panel.background = element_blank(),
# 	legend.position="none") 
# 
# ggsave("demo2_user_plot.png")

}

summaryPlots()

'''