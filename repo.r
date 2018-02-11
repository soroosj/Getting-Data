library(httr)
library(jsonlite)

<<<<<<< HEAD
req <- GET("https://api.github.com/users/jtleek/repos")
=======
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "4f1c34fd567307de159f",
                   secret = "ebc3a210a607945903ac26016dc783fd6da72e72")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
>>>>>>> bbd3869cdc7053f52652b5c1aa70edb9bc6f94c9
stop_for_status(req)
content(req)
