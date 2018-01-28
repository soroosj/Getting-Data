#define path to raw file
   restaurant_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download the raw file
   download.file(restaurant_url,"restaurant.xml",method="curl")
#load file into R
   library(XML)
   library(dplyr)
   doc<-xmlTreeParse("restaurant.xml",useInternal=TRUE)
#identify top node
   rootNode <- xmlRoot(doc)
#parse out zip codes
   zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)
#filter restaurants for zipcode 21231
   zipcode_filter<- zipcode[which(zipcode=="21231")]
#count restaurants for zipcode 21231
   sum(complete.cases(zipcode_filter))
   
   