#Using ggplot2 to produce graphs from Deckers creek stream flow data.
#This code creates the data frame used for the graph.
rank<-as.data.frame(table(Streamflow$`Stream flow`))
#These two varables determine the bar fill and bar line colors.   
barfill<-"royalblue1"
barlines<-"royalblue4"
#This is the code to create the histogram. 
ggplot(data=rank,aes(rank$Freq)) + geom_histogram(aes(y=..count..), color = barlines, fill = barfill) + scale_x_continuous(name="Stream Flow amounts in cfs") + scale_y_continuous("Count") + ggtitle("Frequency histogram of the Stream Flow in cfs")
