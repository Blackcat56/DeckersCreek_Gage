
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

## Data source:

The data source that I will be using is https://waterdata.usgs.gov/wv/nwis/current/?type=flow&group_key=county_cd. This is the same website that we used for the Git Hub Rivers EX.  Another source that  I could use is the National Weather Service (https://water.weather.gov/ahps2/hydrograph.php?gage=dckw2&wfo=pbz) for setting the flood stages. The National Weather service has their flood stage with the flow measurements(cfs) thus I can use their stream flows to write a line in the loop to define the flood stages.  I will use the manual for the National Weather Service source as a reference when classifying flood stages.  (http://www.nws.noaa.gov/directives/sym/pd01009050curr.pdf). 


## Prerequisites
data.table R package
ggplot2 R package 

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

The expected products are a list of all the water stream gages with their first lines as a reference, a list of the different flood stages, a list of flooding times and amounts then graphs created from that list. This will show when the flooding occurs and how high were the flood waters. The lists will help keep everything organized in case there is a problem with the code or they can be used as a reference. The graphs will be a visual aide for my master’s project and for someone wanted to know where the high flooding events were without having to search through the data. 


### Authors 

Amanda Adams

### Acknowledgments
* Thank you to Dr. Hessel for a challaging class. 
* Thank you to the internet for having examples of codes that was an inspiration for this code. 
