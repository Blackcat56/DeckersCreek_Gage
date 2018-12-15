rank<-as.data.frame(table(Streamflow))
#rank<-read.table((Streamflow$Rank),header = TRUE)
ggplot(data=rank,aes(rank$Freq)) + geom_histogram()#this worked somewhat