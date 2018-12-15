rank<-as.data.frame(table(Streamflow$`Stream flow`))
#rank<-read.table((Streamflow$Rank),header = TRUE)
#This produces a histograms!!
ggplot(data=rank,aes(rank$Freq)) + geom_histogram()
