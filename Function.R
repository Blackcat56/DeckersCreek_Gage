#R code for function
#This function creates a new column for the stages. 
StreamFunction<-function(Streamflow){
#Changes the column names to new ones.  
  setnames(Streamflow,old=c("V1","V2","V3"),new=c("Date", "Stream flow", "Tested"))
#This code uses breaks to categoies the stream flow amounts into stages.     
  Streamflow$Stages<-cut(Streamflow$`Stream flow`, breaks = c(0,1250.0,1800.0,2450.0,3150.0,3870.0), labels=c("Not a Flood Stage","Action Flood stage"," Minor Flood Stage","Moderate Flood Stage", "Major Flood Stage" ))
  return(Streamflow)
}
#Omits all of the "0" or "N/A" data from the dataset
Streamflow<-na.omit(Streamflow, col=c(A,P))
#activates the function and adds the column "Rank" to the data set. 
Streamflow<-StreamFunction(Streamflow)