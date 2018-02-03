#Coursera Getting and Cleaning Data, Week 2 Quiz, Problems 2-3

#Install sqldf package to source sqlf function
library(sqldf)

#Download ACS file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","acs.csv")

#Load ACS file into R dataframe
acs<-read.csv("acs.csv")

#Question 2 - query probability weights for ages greater than 50
sqldf("SELECT pwgtp1
      FROM acs
      WHERE AGEP < 50")

#Question 3 - identify equivalent SQL function for R function unique (acs$AGEP)
sqldf("SELECT DISTINCT AGEP 
      FROM acs")