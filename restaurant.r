#define path to raw file
   restaurant_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#download the raw file
   download.file(restaurant_url,"restaurant.xml",method="curl")
   library(XML)
#load file into R
   doc<-xmlTreeParse("restaurant.xml",useInternal=TRUE)
#calculate answer
   rootNode <- xmlRoot(doc)
   zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)
   n_distinct(zipcode)
   