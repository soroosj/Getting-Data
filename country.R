#1. load package(s) into R
      library(tidyverse)

#2. define filepath(s)
      gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      education_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
      
#3.download file(s) to local directory
      download.file(gdp_url,"gdp.csv")
      download.file(education_url,"education.csv")

#4.load file(s) into R
      gdp<-read_csv("gdp.csv")
      education<-read_csv("education.csv")
   
#filter N/As
      gdp_complete <- filter (gdp, !is.na(X1)) 
      
#join tables
      combine <- inner_join(gdp_complete, education, by = c("X1" = "CountryCode"))
      combine_sort <- arrange (combine,desc(X1))
      