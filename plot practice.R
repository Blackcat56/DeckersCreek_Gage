#For the pie chart
rank<-as.data.frame(table(Streamflow$Rank))
colnames(rank)<-c("Rank","Freq")
pie<ggplot(rank, aes(x="",y=Freq, fill=factor(rank)))+
  geom_bar(width = 1, stat="identity")+
  theme(axis.line = element_blank(), plot.title = element_text(hjust=0.5))+
  labs(fill="Rank",
       x=NULL,
       y=NULL,
       title= "Percent of Flood Stages",
       caption = "Source: USGS")
pie + coord_polar(theta = "y", start=0)