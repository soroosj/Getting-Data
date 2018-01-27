#define path to raw file
   community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
#download the raw file
   download.file(community_url,"natgas.xlsx",method="curl")
#load file into R
   dat<-read.xlsx("natgas.xlsx", rows = 18:23, cols = 7:15)
#calculate answer
   sum(dat$Zip*dat$Ext,na.rm=T)