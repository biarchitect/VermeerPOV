library(data.table) #Needed for %like%

clm<-read.csv("../Data/warranty_claims",as.is=TRUE)
# Pulled from the Data Factory job.
clm_names<- c("CLM_ID","PROVIDER_ID","CLM_CD","SUBMIT_LOC_ID","DATA_LANG_CD","SUBMIT_LOC_CLM_REF","RCV_LOC_ID","CLM_SUBMIT_MODE_CD","CLM_CLS_CD","CLM_TYP_CD"
              ,"CLM_CREATE_DT","CLM_STATUS_CD","CLM_STATUS_DT","BATCH_ACTION_CD","CLM_SETTLE_DT","PYMT_TYPE_CD","PYMT_DT","PYMT_ACCT_REF","CLM_RQST_TYPE_CD"
              ,"CLM_CONDTN_CD","IS_PROCESS_AUTO","PREAUTH_REF","IS_TEMPLATE","CLM_TEMPLATE_ID","TEMPLATE_NM","CLM_DESC1","CLM_DESC2","CRNCY_CD","CLM_PRT_TLORGNLAMT"
              ,"CLM_PART_TTLREQAMT","CLM_PART_TTLAMT","CLM_PART_ADJPCT","CLM_PART_ADJAMT","CLM_PRT_DDUCTBLAMT","CLM_PART_NETAMT","CLM_LBR_TTORGNLAMT"
              ,"CLM_LBR_TTLREQAMT","CLM_LBR_TTLAMT","CLM_LBR_ADJPCT","CLM_LBR_ADJAMT","CLM_LBR_DDUCTBLAMT","CLM_LBR_NETAMT","CLM_OTH_TLORGNLAMT"
              ,"CLM_OTH_TTLREQAMT","CLM_OTHCHRG_TTLAMT","CLM_OTHCHRG_ADJPCT","CLM_OTHCHRG_ADJAMT","CLM_OTH_DDUCTBLAMT","CLM_OTHCHRG_NETAMT"
              ,"CLM_PRG_TLORGNLAMT","CLM_PROG_TTLREQAMT","CLM_PROG_TTLAMT","CLM_PROG_ADJPCT","CLM_PROG_ADJAMT","CLM_PRG_DDUCTBLAMT","CLM_PROG_NETAMT","CLM_TTLORGNLAMT"
              ,"CLM_TTLREQAMT","CLM_TTLADJPCT","CLM_TTLADJAMT","CLM_TTLDDUCTBLAMT","CLM_TTLTAXPCT","CLM_TTLTAXAMT","CLM_TTLNETAMT","CLM_PAIDAMT","CREATED_BY_USER"
              ,"UPDATED_BY_USER","CREATED_BY_APPLN","UPDATED_BY_APPLN","CREATED_DT","UPDATED_DT","BASED_ON_TYPE","BASED_ON_ID","BASED_ON_CD","CLM_PART_INCAMT"
              ,"CLM_PART_INCPCT","CLM_LBR_INCAMT","CLM_LBR_INCPCT","CLM_OTHCHRG_INCAMT","CLM_OTHCHRG_INCPCT","CLM_REQTAXAMT","CLM_GSTHST_REQAMT","CLM_GSTHST_ADJAMT"
              ,"CLM_PSTQST_REQAMT","CLM_PSTQST_ADJAMT","CLM_REQNETAMT","SELLING_DLR_ID","CLM_PART_SHRAMT","CLM_LBR_SHRAMT","CLM_OTH_SHRAMT","INTL_PYMT_ACCT_REF"
              ,"MDL_CD","EXT_01_CD","EXT_02_CD","EXT_03_CD","EXT_04_CD","EXT_05_CD","EXT_06_CD","EXT_07_CD","EXT_08_CD","EXT_09_CD","EXT_10_CD","EXT_11_CD","EXT_12_CD"
              ,"PRD_CLS_ID","PRD_SRL","PRIME_PRD_SRL","PRD_ID","OWNR_ID","PRD_USG_UOM_CD1","PRD_USG_VAL1","PRD_USG_UOM_CD2","PRD_USG_VAL2","PRD_USG_UOM_CD3"
              ,"PRD_USG_VAL3","PRD_REGN_NO","CLM_SRVC_ID","SRVC_CVRG_CD1","SRVC_CVRG_ID1","SRVC_CVRG_CD2","SRVC_CVRG_ID2","PARTS_INV_REF","PARTS_PURCH_DT"
              ,"SRVC_CVRG_EXP_DT","SRVC_USG_LMTUOMCD1","SRVC_USG_LMTVAL1","SRVC_FAIL_DT","SRVC_RPR_DT","SRVC_TECH_ID","RPRSITE_TYPE_CD","RPRSITE_ID","RPRSITE_NM"
              ,"RPRSITE_ADDRESS_1","IS_ORG_PART","SRVC_USG_UOM_CD1","SRVC_USG_VAL1","SRVC_USG_UOM_CD2","SRVC_USG_VAL2","SRVC_USG_UOM_CD3","SRVC_USG_VAL3"
              ,"SRVC_PART_CLS_ID","SRVC_PART_CD","SRVC_PART_ID","SRVC_PART_SRL","SRVC_PART_STR_CD","SRVC_PART_STR_NM","SRVC_PART_POSN_CD","SRVC_PART_CNDTN_CD"
              ,"SRVC_PART_SUPP_ID","SRVC_PART_SUPP_NM","SRVC_SUPP_PART_CD","SRVC_SUPP_PART_ID","PY_SRVC_ASM_MDLREF","PY_SRVC_ASM_SRLREF","PY_SRVC_ASM_PRTREF"
              ,"SY_SRVC_ASM_MDLREF","SY_SRVC_ASM_SRLREF","SY_SRVC_ASM_PRTREF","OP_CNDTN_CD","RSN_RPR_CD","WRK_ACCMPLSHED_CD","ROOT_CAUSE_CD","SRVC_PART_ITEM_QTY"
              ,"SRVC_PRT_ITMADJPCT","SRVC_PRT_ITMADJAMT","SRVC_PRT_ITMTTLAMT","SRVC_PRT_TLOGNLAMT","SRVC_PRT_TLREQAMT","SRVC_PART_TTLAMT","SRVC_PART_ADJPCT"
              ,"SRVC_PART_ADJAMT","SRVC_PRT_DDTBLAMT","SRVC_PART_NETAMT","SRVC_LBR_ITEM_HRS","SRVC_LBR_ITMSRTHRS","SRVC_LBR_ITMADJHRS","SRVC_LBR_ITMADJPCT"
              ,"SRVC_LBR_ITMADJAMT","SRVC_LBR_ITMTTLAMT","SRVC_LBR_TLOGLAMT","SRVC_LBR_TTLREQAMT","SRVC_LBR_TTLAMT","SRVC_LBR_ADJPCT","SRVC_LBR_ADJAMT"
              ,"SRVC_LBR_DDTBLAMT","SRVC_LBR_NETAMT","SRVC_OTH_ITMQTY","SRVC_OTH_ITMADJPCT","SRVC_OTH_ITMADJAMT","SRVC_OTH_ITMTLAMT","SRVC_OTH_TTOGLAMT"
              ,"SRVC_OTH_TLREQAMT","SRVC_OTH_TTLAMT","SRVC_OTH_ADJPCT","SRVC_OTH_ADJAMT","SRVC_OTH_DTBLAMT","SRVC_OTH_NETAMT","SRVC_PRG_TLRQAMT","SRVC_PROG_TTLAMT"
              ,"SRVC_PROG_ADJPCT","SRVC_PROG_ADJAMT","SRVC_PR_DDTBLAMT","SRVC_PROG_NETAMT","CUST_CNTCT_DT","TRD_CMPNT_CD","IS_SRVC_COMPLETE","ADDL_INFO_1"
              ,"SRVC_PART_INCAMT","SRVC_PART_INCPCT","SRVC_LBR_INCAMT","SRVC_LBR_INCPCT","SRVC_OTH_INCAMT","SRVC_OTH_INCPCT","RSN_FOR_DELAY","EXT_ID","CLM_SRVC_CD"
              ,"SRVC_STATUS_CD","DENIAL_REASON","POLICY_VERSION","SRVC_SUBTTLREQAMT","SRVC_SUBTTLADJAMT","SRVC_REQTAXRATE","SRVC_ADJTAXRATE","SRVC_REQTAXAMT"
              ,"SRVC_ADJTAXAMT","SRVC_GSTHST_REQAMT","SRVC_GSTHST_ADJAMT","SRVC_PSTQST_REQAMT","SRVC_PSTQST_ADJAMT","SRVC_TTLREQAMT","SRVC_TTLADJAMT","AGC_CODE"
              ,"SUBSYSTEM","SOURCE")
colnames(clm)<-clm_names
write.csv(clm,file="../Data/warranty.csv")

# clm1<-as.data.frame(clm[,c("PRD_SRL","CLM_CREATE_DT","CLM_PART_TTLAMT") ])
#clm_raw
#
clm_raw<-as.data.frame(clm[,c("PRD_SRL","CLM_CREATE_DT","SRVC_FAIL_DT","SRVC_RPR_DT","CLM_PART_TTLAMT","SUBSYSTEM") ])
#Number of rows = 14,387

#head(clm1)
#clean up the data
#clm_clean
clm_clean<-clm_raw[(nchar(clm_raw$PRD_SRL)!= 0),]
#Number of Rows = 13,678
clm_clean<-clm_clean[clm_clean$PRD_SRL != "6191",]
#Number of Rows = 4

clm_clean<-clm_clean[clm_clean$SRVC_FAIL_DT != "\\N",]
#clm1$SUBSYSTEM<-as.factor(clm1$SUBSYSTEM)
#Number of Rows = 636

clm_clean$SUBSYSTEM[clm_clean$SUBSYSTEM == "\\N"]<-"Unknown"
clm_clean$SUBSYSTEM[ nchar(clm_clean$SUBSYSTEM)==1] <-"Unknown"
#Number of Rows 5216

#Consolidate typos and get rid of nonsense fail dates of hours and in the future
clm_clean$SUBSYSTEM[clm_clean$SUBSYSTEM %like% "electrical"]<-"Electrical"
clm_clean<-clm_clean[clm_clean$SRVC_FAIL_DT != "Hours",]
clm_clean<-clm_clean[clm_clean$SRVC_FAIL_DT < "2017-01-01 00:00:00.0000000",]
#The other dates are around 2013 so change this one bad date.
clm_clean[clm_clean$SRVC_FAIL_DT == "0013-03-03 00:00:00.0000000","SRVC_FAIL_DT"] = "2013-03-03 00:00:00.0000000"



############################Summarize Clean Data###################3           
#Make the year week column
#clm_ml
######REQUIRES The function Call

clm_agg<-cbind(fail_week=year_week_date(clm_clean$SRVC_FAIL_DT),clm_clean)

#Aggregate the columns
clm_agg<-aggregate(as.numeric(clm_agg$CLM_PART_TTLAMT),by=list(clm_agg$fail_week,clm_agg$PRD_SRL,clm_agg$SUBSYSTEM),FUN=sum,na.rm=TRUE)

#give the newly aggregated columns names
colnames(clm_agg)<-c("fail_week","PRD_SRL","SUBSYSTEM","WARR_AMT")

#Only use Warranty date ranges that are inside Fault date ranges
range(as.character(clm_agg$fail_week))
#[1] "2003w30" "2016w30"
range(as.character(faultdt$year_week_date))
#[1] "2014w25" "2016w9" 
#clm_out<-clm_out[as.character(clm_out$fail_week) >= "2014w25" & as.character(clm_out$fail_week) <= "2016w9",]
clm_out<-clm_agg[as.character(clm_agg$fail_week) >= range(as.character(faultdt$year_week_date))[1] & 
            as.character(clm_agg$fail_week) <= range(as.character(faultdt$year_week_date))[2],]


# Only join where warranty machine match fault machines





###########Get Fault
###########JOIN to Fault
wrrnty<-data.table(clm_out,key=c("PRD_SRL","fail_week"))
joined<-faultdt[wrrnty]



############WORKING###################
#clm1<-clm1[(nchar(clm1$PRD_SRL)!= 0) || clm1$SRVC_FAIL_DT != "\\N",]
#clm1[(is.na(clm1$SUBSYSTEM) || nchar(clm1$SUBSYSTEM)==1),]$SUBSYSTEM <-"Unknown"
#clm2[clm2$SUBSYSTEM == "\\N",]$SUBSYSTEM=NA;clm2[clm2$SUBSYSTEM %like% "electrical",]$SUBSYSTEM="Electrical"
#table(clm2$SUBSYSTEM,useNA = "ifany")


#clm2$CLM_CREATE_DT<-as.POSIXct(as.Date(clm2$CLM_CREATE_DT))
##2014w25
#paste(substr(strptime(clm2$CLM_CREATE_DT),"%Y"),1,4),"w",strftime(clm2$CLM_CREATE_DT,"%U"),sep="")
clm2<-cbind(fail_week=year_week_date(clm2$SRVC_FAIL_DT),clm2)

clm3<-clm2[,c(1,2,6,7)]
clm3[is.na(clm3$SUBSYSTEM),]$SUBSYSTEM <-"Unknown"

clm1<-aggregate(as.numeric(clm1$CLM_PART_TTLAMT),by=list(clm1$fail_week,clm1$PRD_SRL,clm1$SUBSYSTEM),FUN=sum,na.rm=TRUE)
colnames(clm1)<-c("fail_week","PRD_SRL","SUBSYSTEM","WARR_AMT")
#clm3[is.na(clm3$SUBSYSTEM),]$SUBSYSTEM <-"Unknown";clm3[nchar(clm3$SUBSYSTEM)==1,]$SUBSYSTEM<-"Unknown"
clm3[(is.na(clm3$SUBSYSTEM) || nchar(clm3$SUBSYSTEM)==1),]$SUBSYSTEM <-"Unknown"
mx<-merge(fault,clm1,x.by=c("VMC_VIN","year_week_date"),y.by=c("PRD_SRL","fail_week"))

faultdt<-data.table(fault,key=c("VMC_VIN","year_week_date"))
wrrnty<-data.table(clm1,key=c("PRD_SRL","fail_week"))
joined<-faultdt[wrrnty]
joined[!is.na(joined$ELECTRICAL),]


















