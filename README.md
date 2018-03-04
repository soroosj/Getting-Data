# 1. How the code works:
      Source data
          1.  load tidyverse and stringr package into R
          2a. download and unzip zip file to local directory
          2b. load main traing and test files to R
          2c. load auxiliary files to R.  The activity, subject and column labels are mysteriously stored separately from the main files.
      
      Transform data
          3a. remove invalid characters from features labels.  Characters such as "(","), ","-" and "," are not permitted in column names.
          3b. add column headers to primary files   
          3c. add subject to primary files
          3d. add actvity to primary files
          3e. combine training and test files into one file.
          3f. add activity name.  The activity number is not descriptive so joined in the full activity name.
          3g. extract means, standard deviations from the 500+ statistic set.
      
      Tidy data
          4. tidy data set.  The file is initially not tidy because each statistics is a separate column.
        
      Enrich data  
          5.  calculate average by activity, subject, activity name.
      
      Export results to csv.file
          6.  write stats output to a file

#2. Code book
      Subject - code from 1-30 that designated each of the test or training individuals
      Activity - categorization of each of 6 possible activities (LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS)
      Stat_Name - mean or standard deviation  of hundreds of running-related statistics.  
      Stat_Value - average of Stat_Name grouped by subject and activity
