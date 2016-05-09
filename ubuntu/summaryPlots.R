#This fuction reads all the files starting with docker_compare*#and ubuntu_compare* and outputs 3 .png files containing boxplo# ts comparing docker vs ubuntu for real,user and sys times
 
summaryPlots <- function()
{

#Check for required R packages otherwise install them
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")}

#load packages
library(ggplot2)
library(tidyr)

ufiles=list.files(path=".", pattern="^ubuntu_compare.*csv$")
dfiles=list.files(path=".", pattern="^docker_compare.*csv$")

for (file in ufiles)
{
       
  # if the merged dataset doesn't exist, create it
  if (!exists("f1")){
    f1 <- read.csv(file, header=TRUE)
  }
  else
  # if the merged dataset does exist, append to it
  if (exists("f1")){
    temp_dataset <-read.csv(file, header=TRUE)
    f1 <- rbind.data.frame(f1, temp_dataset)
    rm(temp_dataset)
  }

}

for (file in dfiles){
       
  # if the merged dataset doesn't exist, create it
  if (!exists("f2")){
    f2 <- read.csv(file)
  }
  else
  # if the merged dataset does exist, append to it
  if (exists("f2")){
    temp_dataset <-read.csv(file)
    f2 <- rbind.data.frame(f2, temp_dataset)
    rm(temp_dataset)
  }
}

f1=gather(f1)
f2=gather(f2)

f1$OS="Ubuntu"
f2$OS="Docker"

f12=rbind(f1,f2)

# Ubuntu vs Docker Plots

library(ggplot2)

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

ggsave("real_plot.png")

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

ggsave("sys_plot.png")

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

ggsave("user_plot.png")

}

