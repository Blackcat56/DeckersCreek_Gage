#Function time!
groupF<-function(Streamflow){
if (Streamflow==1250.0){
   Streamflow$`Stream flow`<-NoStage  
 } else if (Streamflow$`Stream flow`=>1250.0 & <){
   Streamflow$Rank<-ActionStage.txt
 } else if (Streamflow==Minor Flood Stage){
   Streamflow$Rank<- MinorStage.txt
 }else if (Streamflow==Moderate Stage){
   Streamflow$Rank<-ModerateStage.txt
 }else if (Streamflow==Major Flood Stage){
   Streamflow$Rank<-MajorStage.txt
 }
results<-list  
return (Streamflow)
}
