# We're about to analyse the Land Surface Temperature variation in Africa in the last 5 years (from 2015 to 2021)


library(raster)
library(ncfd4)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)



# setting the working directory
setwd("C:/lab//mecf/")


# importing all the data downloaded from Copernicus together with the lapply function
# first of all, once we have more than one data in our directory, let's create a list with all the files downloaded using the "list.files" function

lstlist  <- list.files(pattern="LST10") 
lstlist

# results:
[1] "c_gls_LST10-TCI_201701210000_GLOBE_GEO_V1.2.1.nc"
[2] "c_gls_LST10-TCI_201801210000_GLOBE_GEO_V1.2.1.nc"
[3] "c_gls_LST10-TCI_201903210000_GLOBE_GEO_V1.2.1.nc"
[4] "c_gls_LST10-TCI_202001210000_GLOBE_GEO_V1.2.1.nc"
[5] "c_gls_LST10-TCI_202101010000_GLOBE_GEO_V1.3.0.nc"

 # Now let's create a list where each element is the result of applying the "raster" function to its correspondent element in rlist (object) using the "lapply" function

lst_rast <- lapply(lstlist, raster)
lst_rast

# With the "stack" function let's compilate all the data from the previous list only one list

lststack <- stack(lst_rast)  
lststack

lst_17 <- lststack$Fraction.of.Valid.Observations.1
lst_18 <- lststack$Fraction.of.Valid.Observations.2
lst_19 <- lststack$Fraction.of.Valid.Observations.3
lst_20 <- lststack$Fraction.of.Valid.Observations.4
lst_21 <- lststack$Fraction.of.Valid.Observations.5


# using the ggplot function to plot all the files with the "viridis" library

g1 <- ggplot() + 
geom_raster(lst_17 , mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.1)) +
scale_fill_viridis(option="magma") + 
ggtitle("Land surface Temperature - 2017")

g2 <- ggplot() + 
geom_raster(lst_18 , mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.2)) +
scale_fill_viridis(option="magma") + 
ggtitle("Land surface Temperature - 2018")


g3 <- ggplot() + 
geom_raster(lst_19 , mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.3)) +
scale_fill_viridis(option="magma") + 
ggtitle("Land surface Temperature - 2019")

g4 <- ggplot() + 
geom_raster(lst_20 , mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.4)) +
scale_fill_viridis(option="magma") + 
ggtitle("Land surface Temperature - 2020")

g5 <- ggplot() + 
geom_raster(lst_21 , mapping = aes(x=x, y=y, fill=Fraction.of.Valid.Observations.5)) +
scale_fill_viridis(option="magma") + 
ggtitle("Land surface Temperature - 2021")


# plotting them together to compare!!


big_plot <- g1 / g2 / g3/ g4 / g5

pdf("big_plot.pdf")
big_plot <- g1 / g2 / g3/ g4 / g5



# zooming in into Africa - our region of study

ext <- (c(-20, 60, -40, 40))
cl <- colorRampPalette(c("light blue","blue","yellow","orange"))(100)

lst_africa_17 <- crop(lst_17, ext)    
lst_africa_18 <- crop(lst_18, ext) 
lst_africa_19 <- crop(lst_19, ext) 
lst_africa_20 <- crop(lst_20, ext) 
lst_africa_21 <- crop(lst_21, ext) 

pdf("LandSurfaceTemperature.pdf")

par(mfrow=c(3,2))
plot(lst_africa_17, col= cl)
plot(lst_africa_18, col= cl)
plot(lst_africa_19, col= cl)
plot(lst_africa_20, col= cl)
plot(lst_africa_21, col= cl)


