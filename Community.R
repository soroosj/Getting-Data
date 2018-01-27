community_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
community_raw<-read.csv("community.csv")
community <- tbl_df(community_raw)
filter(community, VAL==24)
summarize(community_filter,n())
