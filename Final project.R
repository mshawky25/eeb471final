siteinfo<-read.csv("NRSA_1819_SiteInfo.csv") 
damdata<-read.csv("Dams_Region06.csv")
fcount<-read.csv("nrsa-1819-fish-count-data.csv") #Read all of the data

siteinfo
damdata
fcount

siteinfo.1<-siteinfo[,c("SITE_ID", "COMID", "HUC2", "URBN_NRS18", "VISIT_NO")] #Importing variables from siteinfo 

siteinfo.2 <- siteinfo.1[siteinfo.1$"VISIT_NO" %in% '1',] #Removing all but 1st visit from siteinfo


damdata.1<-damdata[,c("COMID","WsAreaSqKm","DamDensCat","DamNIDStorCat")] #Importing variables from dam data


fcount.1<-fcount[,c("SITE_ID", "IS_DISTINCT", "NON_NATIVE","TAXA_ID", "VISIT_NO")] #Importing variables from fishcount


fcount.2 <- fcount.1[fcount.1$"VISIT_NO" %in% '1',] #Removing all but 1st visit from fish count


damsite<-merge(siteinfo.2, damdata.1, by="COMID", all=F)

damsite

datafish<-merge(fcount.2, damsite, by="SITE_ID", all=F)

datafish

