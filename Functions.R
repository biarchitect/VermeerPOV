year_week_date <-function  (xdate){
  
  dt<-as.POSIXct(as.Date(xdate))
  ##2014w25
  result<-paste(substr(strptime(dt,"%Y"),1,4),"w",strftime(dt,"%U"),sep="")
  return(result)
}