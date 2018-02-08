#load httr library into R
library(XML)
#define path to HTML file
url<-"http://biostat.jhsph.edu/~jleek/contact.html"
#download the HTML file
doc <- readLines(url)
#calculate number of characters per code line
nchar(doc[10])
nchar(doc[20])
nchar(doc[30])
nchar(doc[100])
