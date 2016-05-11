
compareplots <- function(ufile,dfile,demo)
{

#Check for required R packages otherwise install them
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")}

#load packages
library(ggplot2)
library(tidyr)

f1=read.csv(ufile,skip=1)
f1=gather(f1)
f1$OS="Ubuntu"

f2=read.csv(dfile,skip=1)
f2=gather(f2)
f2$OS="Docker"

f12=rbind(f1,f2)

# Ubuntu vs Docker Plots


# Real time plot

p <- ggplot(f12[f12$key=="real",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="REAL (Wall Clock) time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)

p <- p +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
	legend.position="none") 

ggsave(paste(demo,"real_plot.png",sep="_"))

# Sys time plot

p <- ggplot(f12[f12$key=="sys",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="SYS time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)

p <- p +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    legend.position="none")

ggsave(paste(demo,"sys_plot.png",sep="_"))


# User time plot

p <- ggplot(f12[f12$key=="user",], aes(x=OS, y=value)) +  geom_boxplot() + labs(title="USER time: Docker vs Ubuntu",x="Operating System", y="Time (in sec) ")
p <-p + stat_summary(fun.y=mean, geom="point", shape=23, size=4)

p <- p +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
	legend.position="none") 

ggsave(paste(demo,"user_plot.png",sep="_"))


}

compareplots("ubuntu_compare_time.csv","docker_compare_time.csv","demo2")

compareplots("ubuntu_classifier_time.csv","docker_classifier_time.csv","demo3")
