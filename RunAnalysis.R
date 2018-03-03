#1. load package(s) into R
   library(tidyverse)

#2a. download and unzip file(s) to local directory
   run_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(run_url,"run.zip")
   unzip("run.zip")

#2b.load file(s) to R
   train<-read_delim("UCI HAR Dataset/Train/X_train.txt", delim = " ", col_names = FALSE)
   test<-read_delim("UCI HAR Dataset/Test/X_test.txt", col_names = FALSE)

#3. simplify to required rows, columns
   gdp_short <- select (gdp, V1, V2, V4, V5)
   education_short <- select (education, CountryCode, Special.Notes)

#4. join tables
   combine <- inner_join(gdp_short, education_short, by = c("V1" = "CountryCode"))

#5a. identify countries with June fiscal year end
   fiscal <- str_detect(combine$Special.Notes,"Fiscal year end: June 30")

#5b. count countries with June fiscal year end
   sum(fiscal)