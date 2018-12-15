rank<-as.data.frame(table(Streamflow$`Stream flow`))
#rank<-read.table((Streamflow$Rank),header = TRUE)
#This produces a histograms!!
barfill<-"royalblue1"
barlines<-"royalblue4"
ggplot(data=rank,aes(rank$Freq)) + geom_histogram(aes(y=..count..), color =barlines, fill = barfill) + scale_x_continuous(name="Stream Flow amounts in cfs") + scale_y_continuous("Count") + ggtitle("Frequency histogram of the Stream Flow in cfs")
