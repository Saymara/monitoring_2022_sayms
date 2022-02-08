# We're about to analyse the ....

library(raster)
library(ncfd4)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

# setting the working directory

setwd("C:/lab//exam/")

# importing all the data downloaded from Copernicus together with the lapply function
# first of all, once we have more than one data in our directory, let's create a list with all the files downloaded using the "list.files" function

albhlist  <- list.files(pattern="ALBH") 
albhlist

# results:
[1] "c_gls_ALBH_199912130000_GLOBE_VGT_V1.4.1 (1).nc"
[2] "c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc" 


# Now let's create a list where each element is the result of applying the "raster" function to its correspondent element in rlist (object) using the "lapply" function

albh_rast <- lapply(albhlist, raster)
albh_rast


# With the "stack" function let's compilate all the data from the previous list only one list

albhstack <- stack(albh_rast)  
albhstack


albh_1999 <- albhstack$Broadband.hemispherical.albedo.over.total.spectrum.1
albh_2020 <- albhstack$Broadband.hemispherical.albedo.over.total.spectrum.2



# using the ggplot function to plot all the files with the "viridis" library

 g1 <- ggplot() + 
geom_raster(albh_1999 , mapping = aes(x=x, y=y, fill=Broadband.hemispherical.albedo.over.total.spectrum.1)) +
scale_fill_viridis(option="magma") + 
ggtitle("Surface Albedo - 1999")

g2 <- ggplot() + 
geom_raster(albh_2020 , mapping = aes(x=x, y=y, fill=Broadband.hemispherical.albedo.over.total.spectrum.2)) +
scale_fill_viridis(option="magma") + 
ggtitle("Surface Albedo - 2000")


g1 / g2


# plotting the graphs for comparison

cl <- colorRampPalette(c("light green"," light blue","pink","yellow"))(100)
plot(albh_1999, col=cl)













