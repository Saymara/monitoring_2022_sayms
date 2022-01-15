# R code for uploading and visualizing Copernicus data in R

install.packages("ncdf4")
library(ncdf4)
library(raster)


# Set the working directory

setwd("C:/lab//copernicus/")  # the data in this case in stored in a specificaly file within the lab folder called "copernicus"

temperature_01012022 <- raster("c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc")    # importing the data for the Land Surface Temperature downloaded in Copernicus to R
temperature_01012022

plot(temperature_01012022) # Show us the image of the various regions and the temperatures

---------------------------------------------------- \\ -------------- || --------------- // ------------------------------------------------------------------

