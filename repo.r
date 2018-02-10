library(httr)
library(jsonlite)

req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
content(req)
