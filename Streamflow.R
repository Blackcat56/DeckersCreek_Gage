#Deletes everything in your environment
rm(list=ls())
#Library list
library(data.table)
library(ggplot2)

#This code connets the bash script to run in R 
x<-"bash deckers.sh"
system(x,intern = TRUE)

#Reads in the csv file created from the bash decker.sh. Also makes a table from the csv. 
Streamflow<-read.csv("Streamflow.csv",sep = "\t",header = F)

#This function does alot of things to get the data 
source("Function.R")

#Using ggplot2 to produce graphs from Deckers creek stream flow data.
#This section is for the Stream flow section of the stream flow dataset.
#This code creates the data frame used for the graph.
rank<-as.data.frame(table(Streamflow$`Stream flow`))

#histogram portion of the code. 
#These two varables determine the bar fill and bar line colors.   
barfill<-"royalblue1"
barlines<-"royalblue4"

#This is the code to create the histogram. 
ggplot(data=rank,aes(rank$Freq)) + geom_histogram(aes(y=..count..), color = barlines, fill = barfill) + scale_x_continuous(name="Stream Flow amounts in cfs") + scale_y_continuous("Count") + ggtitle("Frequency histogram of the Stream Flow in cfs")
#save the chart
dev.copy(jpeg,'Histogram.jpeg')
dev.off()

#For looking at the rank section of the Rank section of streamflow dataset.  
#Bar Chart
rankF<-as.data.frame(table(Streamflow$Stages))
#Takes away the no flooding stage to make any of the graphs. 
rankF<-rankF[-c(1),]
bp<- ggplot(rankF, aes(x="", y=Freq, fill=Var1)) + geom_bar(width = 1, stat = "identity")
bp
bp+scale_fill_brewer(palette="Dark2")
dev.copy(jpeg,'barchart.jpeg')
dev.off()

#Pie Chart
pie<-bp + coord_polar("y", start = 0)
pie
pie + scale_fill_manual(values = c("lightyellow", "Yellow", "Orange", "Red"))
dev.copy(jpeg,'PieChart.jpeg')
dev.off()