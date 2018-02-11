library(httr)
library(jsonlite)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
doc<-content(req)
doc2<-toJSON(dat)
doc3<-fromJSON(doc2)
doc4<-doc3[,c(doc3$name,doc3$created_at)]
doc4[doc3$name=="datasharing",]
