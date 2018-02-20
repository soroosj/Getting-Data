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
      gdp_short <- select (gdp, V1, V2, V4, V5)  %>%
      as.tibble() 

#2b. simplify education to required columns      
      education_short <- select (education, CountryCode, Income.Group) %>%
      as.tibble()
      
#3. join tables
      combine <- inner_join(gdp_short, education_short, by = c("V1" = "CountryCode")) 
      colnames (combine) <- c("Country.Code", "GDP.Rank", "Country.Name", "GDP",'Income.Group')
      combine <- mutate (combine,GDP.quant = quantile(GDP.Rank,)
      
#4. create GDP ranking quintiles
       
      
#5. count countries by Income.Group & GDP ranking quintile
      combine_group <- group_by(combine, Income.Group)
      summarize (combine_group, m=mean(GDP.Rank))