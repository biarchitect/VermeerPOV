x<-read.csv("../Data/Full Fault Data.csv")
fault<-x[,1:8]
faultdt<-data.table(fault,key=c("VMC_VIN","year_week_date"))
