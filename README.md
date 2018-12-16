
# Determining Flood Stages in Decker's Creek
This code catagories the decker's creek flood stages using the stream flow (units are cfs). The flood stages categories are not in a flood stage, action, minor, moderate, and major flood stage. A minor threat is defined as minimal or not damage but possible some public threat. Moderate flooding is defined as some inundation of structures and roads near the stream, ecauation of people and/ or properties to higher elecations. major flooding is an extensice inunation of structures and roads, siginifcant evacations of people and /or transfer of prperty to higher ground. All definitions are from the National Weather Service manual (Link in Data Source section).   



## Code break down
* The code uses a bash command to download the Decker's Creek, 03062500, gauge data from the USGS. 
	* The output will be a csv file called Streamflow.csv.
* The next step is orginizing the Streamflow data by:   
	* getting rid of any "N/A" in the data
	* Creating the different stages and conecting the stages to the dataset. 
	* Changes the column names of the Streamflow.csv
* The last step is creating and saving graphs from the cleaned data. 
	* Histogram 
	* Bar Chart
	* Pie chart

## Data Source:

The data source that I will be using is [this](https://waterdata.usgs.gov/wv/nwis/dv?cb_00060=on&format=rdb&site_no=03062500&referred_module=sw&period=&begin_date=1946-03-01&end_date=2018-12-15). It is the same website that we used for the Git Hub Rivers EX.  Another source that  I could use is the [National Weather Service](https://water.weather.gov/ahps2/hydrograph.php?gage=dckw2&wfo=pbz) for setting the flood stages. The National Weather service has their flood stage with the flow measurements(cfs) thus I can create a function to categories the stages.  I will use the [manual](http://www.nws.noaa.gov/directives/sym/pd01009050curr.pdf) for the National Weather Service source as a reference when classifying flood stages.


### Packages
* data.table R package
* ggplot2 R package 

### Functions
* Library()#loads the packages need to complete this code.
* read.csv() #reads in the produced csv created from the bash deckers.sh
##### Unix code
* system() #This makes it possible for R to read unix code. 
##### Function's functions
* function() #Creates the function 
* setnames() #Changes the collumn names 
* cut() #Produces the catogories for the flood stages and creates the new column named "Stages" 
* na.omit() #This omits any data that does not have A or P. 
* source() #This connects the function to Streamflow.R.
##### Ggplot's functions 
* ggplot() #Creates the graphs/charts
* dev.copy() #Starts the saving function and has the title of the picture produced.
* dev.off()#This finishs the saving function of the ggplots.
* colnames()#changes the names of the data frames created to plot the data. 
* scale_fill_manual()#This changes the graph colors to the colors that you manually put into this function. 
* scale_fill_brewer()#This changes the graphs color to the brewer's selected color scheme. 
#### The final csv.
* write.csv()#This produces the final csv named "StreamflowD.csv. 


### Example of Unix code:
```unix 
for gauge in "03062500"
do
	wget -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=03062500&referred_module=sw&period=&begin_date=1946-03-03&end_date=2018-12-06"
	sed -n '17p' "$gauge".txt >> flow.txt
	tail -n 26577 "$gauge".txt | cut -d$'\t' -f 3,4,5>> Streamflow.csv
done

```
This code is used by the bash function. 


### Example of R code:
```r 
x<-"bash deckers.sh"
system(x,intern = TRUE)

#Reads in the csv file created from the bash decker.sh. Also makes a table from the csv. 
Streamflow<-read.csv("Streamflow.csv",sep = "\t",header = F)

#This function does alot of things to get the data 
source("Function.R")

```
This R code is from Streamflow.R 

### Example of ggplot code:
```r 
rankF<-as.data.frame(table(Streamflow$Stages))

colnames(rankF)<-c("Stages", "Frequency")

rankF<-rankF[-c(1),]

bp<- ggplot(rankF, aes(x="", y=Frequency, fill=Stages)) + geom_bar(width = 1, stat = "identity")

bp

bp+scale_fill_brewer(palette="Dark2")+ggtitle("Frequency of the Flood Stages")

dev.copy(jpeg,'barchart.jpeg')
dev.off()

```
This code creates the bar chart. 

## Products:
The final products are a final Streamflow csv called StreamflowD.csv. The three final graphs are a histogram, bar chart and pie chart. 
[Histogram](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/Histogram.jpeg)
[Bar Chart](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/barchart.jpeg)
[Pie chart](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/PieChart.jpeg)


### Authors 

Amanda Adams

### Acknowledgments
* Thank you to Dr. Hessl for a challaging class. 
* Thank you to the internet for having examples of codes that help create this code. 
