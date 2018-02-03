#Install sqldf package to source sqlf function
library(sqldf)

#Download ACS file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","acs.csv")

#Load ACS file into R dataframe
acs<-read.csv("acs.csv")

#Query probability weights for ages greater than 50
sqldf("SELECT pwgtp1
      FROM acs
      WHERE AGEP < 50")

