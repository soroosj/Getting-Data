#1. load package(s) into R
   library(tidyverse)
   library(lubridate)
   library(quantmod)

#2. download file(s) to local directory
   amzn = getSymbols("AMZN",auto.assign=FALSE)
   times <- index(amzn)

#3a. count 2010 dates
   times_yr <- year(times)
   times_yr <- times_yr [which (times_yr ==2010)]
   NROW(times_yr)

#4. count 2010 Mondays
   times_mon <- times [which (wday(times, label = TRUE) == "Mon")]
   times_mon_2010 <- times_mon [which (year (times_mon) == 2010)]
   NROW(times_mon_2010)
   