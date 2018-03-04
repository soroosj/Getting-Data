#1. load package(s) into R
   library(tidyverse)
   library(stringr)

#2a. download and unzip file(s) to local directory
   run_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(run_url,"run.zip")
   unzip("run.zip")

#2b.load main file(s) to R
   train<-read_fwf("UCI HAR Dataset/Train/X_train.txt", fwf_empty("UCI HAR Dataset/Train/X_train.txt"))
   as.tibble(train)
   test<-read_fwf("UCI HAR Dataset/Test/X_test.txt", fwf_empty("UCI HAR Dataset/Test/X_test.txt"))
   as.tibble(test)
   
#2c. load auxiliary file(s) to R
   activity_train <-read_delim("UCI HAR Dataset/Train/y_train.txt", delim = " ", col_names = FALSE)
   activity_test <-read_delim("UCI HAR Dataset/Test/y_test.txt", delim = " ", col_names = FALSE)
   activity_labels <- read_fwf("UCI HAR Dataset/activity_labels.txt", fwf_empty("UCI HAR Dataset/activity_labels.txt"))
   subject_train <-read_delim("UCI HAR Dataset/Train/subject_train.txt", delim = " ", col_names = FALSE)
   subject_test <-read_delim("UCI HAR Dataset/Test/subject_test.txt", delim = " ", col_names = FALSE)
   features_labels <- read_delim("UCI HAR Dataset/features.txt", delim = " ", col_names = FALSE)

#3a.remove invalid characters from features labels 
   features_labels <- features_labels$X2
   features_labels2 <- str_replace_all(features_labels,"\\(","")
   features_labels2 <- str_replace_all(features_labels2,"\\)","")
   features_labels2 <- str_replace_all(features_labels2,"\\-","_")
   features_labels2 <- str_replace_all(features_labels2,"\\,","_")
   features_labels2 <- make.names(features_labels2, unique = TRUE)
   
#3a.add column headers to primary files   
   colnames(train) <- features_labels2
   colnames(test) <- features_labels2
   
#3c. add subject to primary files
   train2 <- cbind (subject_train,train) %>%
      rename(Subject = X1)
   test2 <- cbind (subject_test,test) %>%
      rename(Subject = X1)
   
#3d. add actvity to primary files
   train2 <- cbind (activity_train,train2) %>%
      rename(Activity = X1)
   test2 <- cbind (activity_test,test2) %>%
      rename(Activity = X1)

#3e. combine training and test files
   combine <- rbind(test2, train2)
   
#3f. add activity name
   combine$Activity<-as.character(combine$Activity)
   activity_labels$X1<-as.character(activity_labels$X1)
   combine <- left_join(combine, activity_labels, by = c("Activity" = "X1")) %>%
      rename(Activity_Name=X2)
   
#3g. extract means, standard deviations
   combine2 <- select(combine, "Subject","Activity_Name",contains("std"),contains("mean"))
   
#4. tidy data set
   combine3 <- gather(combine2, "Stat_Name", "Stat_Value",tBodyAcc.std...X:angle.Z.gravityMean.) %>%
   arrange(Subject,Activity_Name, Stat_Name)
   
#5. calculate average by activity, subject
   combine4 <-group_by(combine3, Subject,Activity_Name, Stat_Name) %>%
   summarize (Mean = mean(Stat_Value))