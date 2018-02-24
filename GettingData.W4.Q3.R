#1. load package(s) into R
   library(tidyverse)
   library(stringr)
   
#2a. download file(s) to local directory
   gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
   download.file(gdp_url,"gdp.csv",method="curl")

#2b.load file(s) to R
   gdp<-read.csv("gdp.csv", skip = 5, header = FALSE, nrows=190)

#3b. calculate mean
   gdp$V4 <- str_replace_all(gdp$V4,"\\\\","")
   united <- grep("^United",gdp$V4) 
   length(united)