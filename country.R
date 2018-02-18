#1. load package(s) into R
      library(tidyverse)

#2. define filepath(s)
      gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      education_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
      
#3.download file(s) to local directory
      download.file(gdp_url,"gdp.csv")
      download.file(education_url,"education.csv")

#4.load file(s) into R
      gdp<-read.csv("gdp.csv", skip = 3, stringsAsFactors = F)
      as.tibble(gdp)
      education<-read.csv("education.csv", stringsAsFactors = F)
      as.tibble(education)
      
#join tables
      combine <- inner_join(gdp, education, by = c("X" = "CountryCode"))
      nrow(combine)
      combine_sort <- arrange (combine,desc(Ranking))
      