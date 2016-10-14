x<-read.csv("../Data/Full Fault Data.csv")
#fault<-x[,1:8]
faultdt<-data.table(fault,key=c("VMC_VIN","year_week_date"))

ftrain<-read.csv("../Data/fault_train.csv")
ftest<-read.csv("../Data/fault_test.csv")
ftrn1<-ftrain[,-41]
ftrn1<-ftrn1[,-71]
ftrn1<-ftrn1[,-105]
  