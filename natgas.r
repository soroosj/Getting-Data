#load xlsx library into R
   library(xlsx)
#define path to Excel file
   community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
#download the Excel file
   download.file(community_url,"natgas.xlsx",method="curl")
#load Excel file into R and create dataframe
   dat<-read.xlsx("natgas.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15, header=TRUE)
#calculate answer
   sum(dat$Zip*dat$Ext,na.rm=T)
   