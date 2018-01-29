#define the filepath
   community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download the file
   download.file(community_url,"community.csv",method="curl")
#load file into R
   community<-read.csv("community.csv")
#filter on rows in which property value > $1m
   community_filter <- community[which(community$VAL==24),]
#count rows in which property value >$1m
   nrow(community_filter) 
   
