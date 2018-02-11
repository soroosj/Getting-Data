# install httr library to source from API
library(httr)
# install jsonlite library to convert JSON format to dataframe
library(jsonlite)

# extract document from Github API
req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
doc<-content(req)

#convert API format to JSON
json1<-toJSON(doc)
#convert JSON format to dataframe
json2<-fromJSON(json1)

#select required data
subset(json2,name=="datasharing",created_at)