#Delets everything in your environment
rm(list=ls())
#Library list
library(data.table)
#Reads in the csv file created from the bash decker.sh. Also makes a table from the csv. 
Streamflow<-read.csv("Streamflow.csv",sep = "\t",header = F)
#Takes the black data out of the csv
Streamflow<-na.omit(Streamflow, col=c(A,P))
#renames the column names. 
setnames(Streamflow,old=c("V1","V2","V3"),new=c("Date", "Stream flow in cfs", "Tested"))
#Adds a new row that cateogies if the flood stages are there or not. 
Streamflow$Rank<-cut(Streamflow$`Stream flow in cfs`, breaks = c(0,1250.0,1800.0,2450.0,3150.0,3870.0), labels=c("not flooding","Action stage","Flood Stage","Moderate Stage", "Major Flood Stage" ))
