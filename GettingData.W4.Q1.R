#1. load package(s) into R
   library(tidyverse)
   
#2a. download file(s) to local directory
   community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
   download.file(community_url,"community.csv",method="curl")

#2b.load file(s) to R
   community<-read.csv("community.csv")

#3a. create list of field names
   community_names <- names(community) %>%

#3b. remove "wgtp" from field names
   strsplit("wgtp")
   
#3c. identify 123rd element
   community_names[[123]]