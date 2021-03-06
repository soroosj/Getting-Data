#1. load package(s) into R
   library(tidyverse)
   library(stringr)
   
#2a. download file(s) to local directory
   gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
   download.file(gdp_url,"gdp.csv",method="curl")

#2b.load file(s) to R
   gdp<-read.csv("gdp.csv", skip = 5, header = FALSE, nrows=190)

#3a. remove decimals
   gdp$V5 <- str_replace_all(gdp$V5,",","") %>%
   as.integer()

#3b. calculate mean
   mean(gdp$V5)