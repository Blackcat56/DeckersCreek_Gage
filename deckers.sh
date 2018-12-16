#Shell bash script
#Decker's Creeks download
for gauge in "03062500"
do
	wget -O "$gauge".txt "https://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=03062500&referred_module=sw&period=&begin_date=1946-03-03&end_date=2018-12-06"
	tail -n 26577 "$gauge".txt | cut -d$'\t' -f 3,4,5>> Streamflow.csv
done


