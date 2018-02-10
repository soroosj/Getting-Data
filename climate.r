#load XML library
library(readr)

#define path to fixed width file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

#download the HTML file to a character vector
read_fwf(url,skip=3, fwf_positions(28,32))

#calculate number of characters per code line
nchar(doc[10])
nchar(doc[20])
nchar(doc[30])
nchar(doc[100])