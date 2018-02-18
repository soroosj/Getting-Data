#1. load package(s) into R
      library(tidyverse)

#2. define filepath(s)
      gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      education_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
      
#3.download file(s) to local directory
      download.file(gdp_url,"gdp.csv")
      download.file(education_url,"education.csv")

#4.load file(s) into R
      gdp<-read.csv("gdp.csv", skip = 3, stringsAsFactors = F, na.strings = "")
      as.tibble(gdp)
      education<-read.csv("education.csv", stringsAsFactors = F)
      as.tibble(education)
      
#filter N/As
      gdp_filter <- filter (gdp, !is.na(Ranking)) 
      
#join tables
      combine <- inner_join(gdp_filter, education, by = c("X" = "CountryCode")) %>%
      nrow() %>%
      select(X,Table.Name, Ranking, US.dollars.)
      