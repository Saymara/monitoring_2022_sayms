# R code for uploading and visualizing Copernicus data in R

install.packages("ncdf4")
library(ncdf4)
library(raster)


# Set the working directory

setwd("C:/lab//copernicus/")  # the data in this case in stored in a specificaly file within the lab folder called "copernicus"

temperature_01012022 <- raster("c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc")    # importing the data for the Land Surface Temperature downloaded in Copernicus to R

# to see how many layers are inside Copernicus data:
temperature_01012022_ <- brick("c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc")

temperature_01012022

plot(temperature_01012022) # Show us the image of the various regions and the temperatures

---------------------------------------------------- \\ -------------- || --------------- // ------------------------------------------------------------------

# day of using Copernicus

cl <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(temperature_01012022, col=cl)

# this is bad!
cl <- colorRampPalette(c("blue","green","red"))(100)  # a color palette with the RGB range of colors
plot(temperature_01012022,col=cl)




