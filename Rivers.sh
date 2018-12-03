for gauge in "03062500" $1
do
	wget -O "$gauge".txt "https://nwis.waterdata.usgs.gov/wv/nwis/uv/?cb_00060=on&cb_00065=on&format=rdb&site_no=03062500&period=&begin_date=1950-11-01&end_date=2018-12-03"
	sed -n '17p' "$gauge".txt >> flow.txt
	tail -n 1 "$gauge".txt | cut -d$'\t' -f 3,5 >> flows_out.txt

done
cut -d$'\t' -f 3 -f 5 flow.txt > flow2.txt
paste - - < flow2.txt > discharge.txt
#This code line combines the two lines from flow output into one line for the new text file, most_recent_discharge.

rm flow.txt flow2.txt
#This code deletes flow.txt and flow2.txt. These text files are not useful after geting the single file most_recent_discharge.txt 
