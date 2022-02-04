# R code for uploading and visualizing Copernicus data in R

install.packages("ncdf4")
install.packages("viridis")
library(ncdf4)
library(raster)
library(ggplot2)
library(patchwork)
library(viridis)
library(patchwork)
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

rlist <- list.files(pattern="LST10")      # "list.files" stands for creating a list of all the files that have the indicated pattern from our directory.

rlist

[1] "c_gls_LST10-TCI_202101110000_GLOBE_GEO_V2.1.1.nc"  ; [2] "c_gls_LST10-TCI_202201010000_GLOBE_GEO_V2.1.1.nc"  # results (generated files)

list_rast <- lapply(rlist, raster)  # returns a list where each element is the result of applying "raster" (function) to the corresponding element of rlist (object)
list_rast

temperaturestack <- stack(list_rast)  # the stack function "compilates" all the info from the object in only one list
temperaturestack

temp_21 <- temperaturestack$Fraction.of.Valid.Observations.1
temp_22 <- temperaturestack$Fraction.of.Valid.Observations.2 


ggplot() +
geom_raster(temp_21, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.1)) +
scale_fill_viridis(option="viridis") +ggtitle("2021 temperature image")

ggplot() + 
geom_raster(temp_22, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.2)) +
scale_fill_viridis(option="viridis") +ggtitle("2022 temperature image")
 
# plotting them together

p1 <- ggplot() +
geom_raster(temp_21, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("2021 temp image")

p2 <- ggplot() +
geom_raster(temp_22, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("2022 temp image")

p1/p2  # final plot with the 2 images

--------------------------------------------_-----------------------_-----------------------------------_---------------------------------------

# what if we wanna zoom  our image into a certain place?
# we can crop the image on a certain area!!


# longitude from -20 to 60
# latitude from -40 to 40

ext <- c(-20, 60, -40, 40)

stack_cropped <- crop(temperaturestack, ext)    # this will crop the whole stack

temp_21_cv <- crop(temp_21, ext)
temp_22_cv <- crop(temp_22, ext)

plot(temp_21_cv)


# now let's patch the new cropped images together!

p1 <- 
ggplot() +
geom_raster(temp_21_africa, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.1)) +
scale_fill_viridis(option="viridis") +
ggtitle(" January 2021 africa's temperature image")

p2 <- 
ggplot() +
geom_raster(temp_22_africa, mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.2)) +
scale_fill_viridis(option="viridis") +
ggtitle(" January 2022 africa's temperature image")















