#1a. load package(s) into R
      library(tidyverse)

#1b. define filepath(s)
      gdp_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
      education_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
      
#1c.download file(s) to local directory
      download.file(gdp_url,"gdp.csv")
      download.file(education_url,"education.csv")

#1d.load file(s) to R
      gdp<-read.csv("gdp.csv", skip = 5, header = FALSE, na.strings = c("","NA"), nrows=190, stringsAsFactors = F)

      education<-read.csv("education.csv", stringsAsFactors = F)
      
#2a. simplify gdp to required rows, columns
      gdp <- filter (gdp) %>%
      select (V1, V2, V4, V5)  %>%
      as.tibble() 

#2b. simplify education to required columns      
      education <- select (education, CountryCode) %>%
      as.tibble()
      
#3. join tables
      combine <- inner_join(gdp, education, by = c("V1" = "CountryCode")) 

#4a. count unique rows across tables
      nrow(combine) 
      
#4b. identify 13th smallest GDP 
      combine <- arrange (combine, desc(V2))
      colnames (combine) <- c("Country Code", "GDP Rank", "Country Name", "GDP")
      combine[13,]