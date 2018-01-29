#load R's XML library
   library(XML)
#define path to XML document
   restaurant_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download XML document
   download.file(restaurant_url,"restaurant.xml",method="curl")
#load XML document into R
   doc<-xmlParse("restaurant.xml")
#isolate zipcode nodes
   zipcode<-xpathSApply(doc,"//zipcode",xmlValue)
#filter zipcode 21231
   zipcode_filter<- zipcode[which(zipcode=="21231")]
#count restaurants on zipcode 21231
   length(zipcode_filter)