#1. load package(s) into R
   library(tidyverse)
   library(lubridate)
   library(quantmod)

#2. download file(s) to local directory
   amzn = getSymbols("AMZN",auto.assign=FALSE)
   sampleTimes = index(amzn)

#3a. count 2010 dates
   sampleTimesyear <- year(amzn) == 2010
   sum(sampleTimesyear)

#4. count 2010 Mondays
   sampleTimesyear <- year(amzn) == 2010 & wday(amzn,label=T) == "Mon"
   sum(sampleTimesyear)