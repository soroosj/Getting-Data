#1. load package(s) into R
   library(tidyverse)

#2a. download and unzip file(s) to local directory
   run_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(run_url,"run.zip")
   unzip("run.zip")

#2b.load file(s) to R
   train<-read_fwf("UCI HAR Dataset/Train/X_train.txt", fwf_empty("UCI HAR Dataset/Train/X_train.txt"))
   test<-read_fwf("UCI HAR Dataset/Test/X_test.txt", fwf_empty("UCI HAR Dataset/Test/X_test.txt"))
   as.tibble(train)
   as.tibble(test)
   activity_train <-read_delim("UCI HAR Dataset/Train/y_train.txt", delim = " ", col_names = FALSE)
   activity_test <-read_delim("UCI HAR Dataset/Test/y_test.txt", delim = " ", col_names = FALSE)
   activity_labels <- read_fwf("UCI HAR Dataset/activity_labels.txt", fwf_empty("UCI HAR Dataset/activity_labels.txt"))
   subject_train <-read_delim("UCI HAR Dataset/Train/subject_train.txt", delim = " ", col_names = FALSE)
   subject_test <-read_delim("UCI HAR Dataset/Test/subject_test.txt", delim = " ", col_names = FALSE)
   features_labels <- read_delim("UCI HAR Dataset/features.txt", delim = " ", col_names = FALSE)

#3a.add column headers to primary files
   features_labels <- features_labels$X2
   colnames(train) <- features_labels
   colnames(test) <- features_labels
   
#3b. add activity, subject to primary files
   train <- cbind (subject_train,activity_train, train)
   
#3. simplify to required rows, columns
   gdp_short <- select (gdp, V1, V2, V4, V5)
   education_short <- select (education, CountryCode, Special.Notes)

#4. join tables
   combine <- inner_join(gdp_short, education_short, by = c("V1" = "CountryCode"))

#5a. identify countries with June fiscal year end
   fiscal <- str_detect(combine$Special.Notes,"Fiscal year end: June 30")

#5b. count countries with June fiscal year end
   sum(fiscal)