# R code for uploading and visualizing Copernicus data in R

install.packages("ncdf4")
install.packages("viridis")
library(ncdf4)
library(raster)
library(ggplot2)
library(patchwork)
library(viridis)

# Set the working directory

setwd("C:/lab//copernicus/")  # the data in this case in stored in a specificaly file within the lab folder called "copernicus"

temperature_01012022 <- raster("c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc")    # importing the data for the Land Surface Temperature downloaded in Copernicus to R

# to see how many layers are inside Copernicus data:
#temperature_01012022_ <- brick("c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc")

temperature_01012022

plot(temperature_01012022) # Show us the image of the various regions and the temperatures

---------------------------------------------------- \\ -------------- || --------------- // ------------------------------------------------------------------

# day of using Copernicus

cl <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(temperature_01012022, col=cl)

# this is bad!
cl <- colorRampPalette(c("blue","green","red"))(100)  # a color palette with the RGB range of colors
plot(temperature_01012022,col=cl)

# ggplot function
ggplot() + 
geom_raster(temperature_01012022, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations))  # the "ggplot"  function stands for declarating an input data frame for a graphic and to specify the set of plot aesthetics


# ggplot function with viridis
ggplot() + 
geom_raster(temperature_01012022, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations)) +
scale_fill_viridis() 

ggplot() + 
geom_raster(temperature_01012022, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations)) +
scale_fill_viridis(option="cividis") 

ggplot() + 
geom_raster(temperature_01012022, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations)) +
scale_fill_viridis(option="cividis") + 
ggtitle("cividis palette")

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# importing all the data together with the lapply function

rlist <- list.files(pattern="LST10")      # "list.files" stands for creating a  list of files with the indicated pattern in the directory.

rlist

# [1] "c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc" - result

list_rast <- lapply(rlist, raster)  # returns a list where each element of which is the result of applying "raster" (function) to the corresponding element of rlist (object)
list_rast

temperaturestack <- stack(list_rast)  # the stack function "compilates" all the info from the object in one list
temperaturestack


temp_01 <- temperaturestack$Fraction.of.Valid.Observations 

ggplot() +
geom_raster(temp_01, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations)) +
scale_fill_viridis(option="viridis") +
ggtitle("Sayms_temp_code!")






