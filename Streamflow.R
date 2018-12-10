#Delets everything in your environment
rm(list=ls())
#Reads in teh csv file created from the bash decker.sh. Also makes a table from the csv. 
Streamflow<-read.csv("Streamflow.csv",sep = "\t",header = F)
#Takes the black data out of the csv
Streamflow<-na.omit(Streamflow, col=c(A,P))
library(data.table)
#renames the column names. 
setnames(Streamflow,old=c("V1","V2","V3"),new=c("Date", "Stream flow in cfs", "Tested"))
           