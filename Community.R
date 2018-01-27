#download the file
   community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
   download.file(community_url,"community.csv",method="curl")
#load file into R
   community_raw<-read.csv("community.csv")
#create data table
   community <- tbl_df(community_raw)
#filter on rows in which property value > $1m
   filter(community, VAL==24)
#count rows in which property value >$1m
   summarize(community_filter,n())
   