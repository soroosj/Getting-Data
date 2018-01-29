#define path to raw file
   restaurant_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download the raw file
   download.file(restaurant_url,"restaurant.xml",method="curl")
#load file into R
   library(XML)
   doc<-xmlTreeParse("restaurant.xml",useInternal=TRUE)
#isolate zip codes
   zipcode<-xpathSApply(doc,"//zipcode",xmlValue)
#filter on zipcode 21231
   zipcode_filter<- zipcode[which(zipcode=="21231")]
#count restaurants on zipcode 21231
   sum(complete.cases(zipcode_filter))