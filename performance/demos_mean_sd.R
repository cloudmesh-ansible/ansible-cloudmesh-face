demos_mean_sd <- function()

{

if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")}

#load packages
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



sys_docker=c(mean(f12[f12$key=="sys" & f12$OS=="Docker",2]), sd(f12[f12$key=="sys" & f12$OS=="Docker",2]))
sys_ubuntu=c(mean(f12[f12$key=="sys" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="sys" & f12$OS=="Ubuntu",2]))

real_docker=c(mean(f12[f12$key=="real" & f12$OS=="Docker",2]),sd(f12[f12$key=="real" & f12$OS=="Docker",2]))
real_ubuntu=c(mean(f12[f12$key=="real" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="real" & f12$OS=="Ubuntu",2]))

user_docker=c(mean(f12[f12$key=="user" & f12$OS=="Docker",2]),sd(f12[f12$key=="user" & f12$OS=="Docker",2]))
user_ubuntu=c(mean(f12[f12$key=="user" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="user" & f12$OS=="Ubuntu",2]))

demo2_mean_sd=rbind(real_docker,real_ubuntu,user_docker,user_ubuntu,sys_docker,sys_ubuntu)
colnames(demo2_mean_sd)=c("Mean","SD")

write.csv(demo2_mean_sd,"demo2_mean_sd.csv")


###Demo3


ufiles=list.files(path=".", pattern="^ubuntu_classifer.*csv$")
dfiles=list.files(path=".", pattern="^docker_classifer.*csv$")

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



sys_docker=c(mean(f12[f12$key=="sys" & f12$OS=="Docker",2]), sd(f12[f12$key=="sys" & f12$OS=="Docker",2]))
sys_ubuntu=c(mean(f12[f12$key=="sys" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="sys" & f12$OS=="Ubuntu",2]))

real_docker=c(mean(f12[f12$key=="real" & f12$OS=="Docker",2]),sd(f12[f12$key=="real" & f12$OS=="Docker",2]))
real_ubuntu=c(mean(f12[f12$key=="real" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="real" & f12$OS=="Ubuntu",2]))

user_docker=c(mean(f12[f12$key=="user" & f12$OS=="Docker",2]),sd(f12[f12$key=="user" & f12$OS=="Docker",2]))
user_ubuntu=c(mean(f12[f12$key=="user" & f12$OS=="Ubuntu",2]),sd(f12[f12$key=="user" & f12$OS=="Ubuntu",2]))

demo3_mean_sd=rbind(real_docker,real_ubuntu,user_docker,user_ubuntu,sys_docker,sys_ubuntu)
colnames(demo3_mean_sd)=c("Mean","SD")

write.csv(demo3_mean_sd,"demo3_mean_sd.csv")
}

demos_mean_sd()
