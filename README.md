
# Determining Flood Stages in Decker's Creek
This code finds out how many times decker's creek when into a flood stage. The flood stages categories are not in a flood stage, action, minor, moderate, and major flood stage.    



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

## Data source:

The data source that I will be using is [this](https://waterdata.usgs.gov/wv/nwis/dv?cb_00060=on&format=rdb&site_no=03062500&referred_module=sw&period=&begin_date=1946-03-01&end_date=2018-12-15). It is the same website that we used for the Git Hub Rivers EX.  Another source that  I could use is the [National Weather Service](https://water.weather.gov/ahps2/hydrograph.php?gage=dckw2&wfo=pbz) for setting the flood stages. The National Weather service has their flood stage with the flow measurements(cfs) thus I can use their stream flows to write a line in the loop to define the flood stages.  I will use the [manual](http://www.nws.noaa.gov/directives/sym/pd01009050curr.pdf) for the National Weather Service source as a reference when classifying flood stages.


## Prerequisites
* data.table R package
* ggplot2 R package 

### Example code:
```unix 
for gauge in "03062500"
do
	wget -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=03062500&referred_module=sw&period=&begin_date=1946-03-03&end_date=2018-12-06"
	sed -n '17p' "$gauge".txt >> flow.txt
	tail -n 26577 "$gauge".txt | cut -d$'\t' -f 3,4,5>> Streamflow.csv
done

```
## Products:
The final products are a final Streamflow csv called StreamflowD.csv. The three final graphs are a histogram, bar chart and pie chart. 
[Histogram](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/Histogram.jpeg)
[Bar Chart](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/barchart.jpeg)
[Pie chart](https://github.com/Blackcat56/Gaging_Flooding/blob/master/Output/PieChart.jpeg)
### Authors 

Amanda Adams

### Acknowledgments
* Thank you to Dr. Hessel for a challaging class. 
* Thank you to the internet for having examples of codes that was an inspiration for this code. 
