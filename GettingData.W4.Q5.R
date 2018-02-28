#1. load package(s) into R
   library(tidyverse)
   library(lubridate)
   library(quantmod)

#2. download file(s) to local directory
   amzn = getSymbols("AMZN",auto.assign=FALSE)
   times <- index(amzn)

#3a. count 2015 dates
   times_yr <- year(times)
   times_yr <- times_yr [which (times_yr ==2012)]
   NROW(times_yr)

#4. count 2015 Mondays
   times_mon <- times [which (wday(times, label = TRUE) == "Mon")]
   times_mon_2012 <- times_mon [which (year (times_mon) == 2012)]
   NROW(times_mon_2012)
   