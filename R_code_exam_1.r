# We're about to analyse the ....

library(raster)
library(ncdf4)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

# setting the working directory

setwd("C:/lab//exam/")

# importing all the data downloaded from Copernicus together with the lapply function
# first of all, once we have more than one data in our directory, let's create a list with all the files downloaded using the "list.files" function

aldhlist  <- list.files(pattern="ALDH") 
aldhlist

# results:

[1] "c_gls_ALDH_200011230000_GLOBE_VGT_V1.4.1.nc"   
[2] "c_gls_ALDH_201011230000_GLOBE_VGT_V1.4.1.nc"   
[3] "c_gls_ALDH_202006130000_GLOBE_PROBAV_V1.5.1.nc"


# Now let's create a list where each element is the result of applying the "raster" function to its correspondent element in rlist (object) using the "lapply" function

aldh_rast <- lapply(aldhlist, raster)
aldh_rast


# With the "stack" function let's compilate all the data from the previous list only one list

aldhstack <- stack(aldh_rast)  
aldhstack


aldh_2000 <- aldhstack$Broadband.directional.albedo.over.total.spectrum.1
aldh_2010 <- aldhstack$Broadband.directional.albedo.over.total.spectrum.2
aldh_2020 <- aldhstack$Broadband.directional.albedo.over.total.spectrum.3



# using the ggplot function to plot all the files with the "viridis" library

g1 <- ggplot() + 
geom_raster(aldh_2000 , mapping = aes(x=x, y=y, fill=Broadband.directional.albedo.over.total.spectrum.1)) +
scale_fill_viridis(option="magma") + 
ggtitle("Directional Albedo - 2000")

g2 <- ggplot() + 
geom_raster(aldh_2010 , mapping = aes(x=x, y=y, fill=Broadband.directional.albedo.over.total.spectrum.2)) +
scale_fill_viridis(option="magma") + 
ggtitle("Directional Albedo - 2010")


g3 <- ggplot() + 
geom_raster(aldh_2020 , mapping = aes(x=x, y=y, fill=Broadband.directional.albedo.over.total.spectrum.3)) +
scale_fill_viridis(option="magma") + 
ggtitle("Directional Albedo - 2020")


g1 / g2 / g3


# plotting the graphs for comparison

cl <- colorRampPalette(c("light blue"," green","pink","yellow"))(100)
plot(aldhstack, col=cl)













