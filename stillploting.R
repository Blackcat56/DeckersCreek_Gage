rank<-as.data.frame(table(Streamflow$`Stream flow`))
#rank<-read.table((Streamflow$Rank),header = TRUE)
#This produces a histograms!!
ggplot(data=rank,aes(rank$Freq)) + geom_histogram()+scale_x_continuous(name="Stream Flow amounts in cfs") + scale_y_continuous("Count") + ggtitle("Frequency histogram of the Stream Flow in cfs")
