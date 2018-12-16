#R code that connects the Unix code and R function to produces flood stages.
#Deletes everything in your environment
rm(list=ls())
#Library list
library(data.table)
library(ggplot2)

#This code connets the bash script to run in R by using system().
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

#histogram code. 
#These two varables determine the bar fill and bar line colors.   
barfill<-"royalblue1"
barlines<-"royalblue4"

#This is the code to create the histogram. 
ggplot(data=rank,aes(rank$Freq)) + geom_histogram(aes(y=..count..), color = barlines, fill = barfill) + scale_x_continuous(name="Stream Flow amounts in cfs") + scale_y_continuous("Count") + ggtitle("Frequency histogram of the Stream Flow in cfs")
#save the chart as a jpeg.
dev.copy(jpeg,'Histogram.jpeg')
dev.off()

#For looking at the rank section of the Rank section of streamflow dataset.  
#Bar Chart
#Creates a data frame from Streamflow dataset
rankF<-as.data.frame(table(Streamflow$Stages))
#Changes the column names to make it more professinal. 
colnames(rankF)<-c("Stages", "Frequency")
#Takes away the no flooding stage to make any of the graphs. 
rankF<-rankF[-c(1),]
#creates the bar chart. 
bp<- ggplot(rankF, aes(x="", y=Frequency, fill=Stages)) + geom_bar(width = 1, stat = "identity")

#calls the chart so it will plot. 
bp
#Then changes the colors of the bar chart.
bp+scale_fill_brewer(palette="Dark2")+ggtitle("Frequency of the Flood Stages")
#Saves the plot as a jpeg. 
dev.copy(jpeg,'barchart.jpeg')
dev.off()

#Pie Chart
#Creates the pie chart by calling the varible from the chart above.
pie<-bp + coord_polar("y", start = 0)+ ggtitle("Frequency of the Flood Stages")
#calls the chart 
pie

#Changes the colors of the chart. 
pie + scale_fill_manual(values = c("lightyellow", "Yellow", "Orange", "Red"))

#saves the plot as a jpeg. 
dev.copy(jpeg,'PieChart.jpeg')
dev.off()

#Writing out the cleaned data to a csv
write.csv(Streamflow, file = "StreamflowD.csv",row.names=FALSE)
