#1. load package(s) into R
   library(tidyverse)
   library(stringr)

#2a. download file(s) to local directory
   gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
   download.file(gdp_url,"gdp.csv")
   education_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
   download.file(education_url,"education.csv")

#2b.load file(s) to R
   gdp<-read.csv("gdp.csv", skip = 5, header = FALSE, na.strings = c("","NA"), nrows=190, stringsAsFactors = F)
   education<-read.csv("education.csv", stringsAsFactors = F)

#3. simplify to required rows, columns
   gdp_short <- select (gdp, V1, V2, V4, V5)
   education_short <- select (education, CountryCode, Special.Notes)

#4. join tables
   combine <- inner_join(gdp_short, education_short, by = c("V1" = "CountryCode"))

#5a. identify countries with June fiscal year end
   fiscal <- str_detect(combine$Special.Notes,"Fiscal year end: June 30")

#5b. count countries with June fiscal year end
   sum(fiscal)