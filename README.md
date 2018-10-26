Proposal for ESDA 693G:


Determining Flooding in rivers


By Amanda Adams



Objectives:

  
  My objectives for the final project are to download river stream data, organize it, loop it and finally create a graph showing flooding events. This project will use river gage sites in WV and determine if the water flows are considered flood waters. I want the time line to be from historical to current time for each gage sides. I want to download then organize all the data into their own folders corresponding to their counties. I want to create a loop that can use any of the gage sites then create a list of all the stream levels. Downloading, organizing and creating the lists will all be done using the bash terminal. The lists then are used to create graphs in R.  I am also going to use the product of the bash script for my python class final project. I will use the final product for Decker’s creek for my master’s project. 



Data source:



  The data source that I will be using is https://waterdata.usgs.gov/wv/nwis/current/?type=flow&group_key=county_cd. This is the same website that we used for the Git Hub Rivers EX.  Another source that  I could use is the National Weather Service (https://water.weather.gov/ahps2/hydrograph.php?gage=dckw2&wfo=pbz) for setting the flood stages. The National Weather service has their flood stage with the flow measurements(cfs) thus I can use their stream flows to write a line in the loop to defining the flood stages.  I will use the manual for the National Weather Service source as a reference when classifying flood stages.  (http://www.nws.noaa.gov/directives/sym/pd01009050curr.pdf). 



Implementations:

  
  The implementation for this project is for the product to be used in my master project. My master’s project is to see how precisely, and accuracy drone pictures can be used to create a flood map. I want to create a 3D model that can use this project output to reproduce historical and present floods in the Decker’s creek area. 
People that want to look at flooding can also use this code. I hope to get it to run for every state and river. The only problem that will occur when looking at the flood stages. River beds are different for every river and does change continually thus the flood stages will need to change for each river that is an input to the code. 


Expected Products:

  
  
  The expected products are a list of all the water stream gages with their first lines as a reference, a list of the different flood stages, a list of flooding times and amounts then graphs created from that list. This will show when the flooding occurs and how high were the flood waters. The lists will help keep everything organized in case there is a problem with the code or they can be used as a reference. The graphs will be a visual aide for my master’s project and for someone wanted to know where the high flooding events were without having to search through the data. 



Questions for the instructor:

  
  Since we have already done something like this in class will it still be considered original project? Is this enough to be considered a final project? Do I have to add more states for the project acceptable? Is this something that you think I can create on time? What could be added to make this project better? Can I create more items in R that would be good for my master project? 
