#load readr library
library(readr)

#define path to fixed width file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

#download the fixed width file to a double vector
dat<-read_fwf(url,skip=4, fwf_positions(28,32))

#sum the field
sum(dat)
