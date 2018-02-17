#1. load packages into R
      library(jpeg)

#2. define the filepath
      jeff_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
      
#3.download the file
      download.file(jeff_url,"jeff.jpeg")

#load file into R
      jeff<-readJPEG("jeff.jpeg", native = TRUE)
   
#calculate quantile
      quantile(jeff,c(.30,.80))