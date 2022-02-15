# pt.1
# We're about to analyse the Land Surface Temperature variation in Africa in the last 5 years (from 2015 to 2021)


library(raster)
library(ncdf4)
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
[3] "c_gls_LST10-TCI_201901010000_GLOBE_GEO_V1.2.1.nc"
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
big_plot 
dev.off()


# zooming in into Africa  - our region of study


# coordenates for the African continent
# longitude - from -20 to 60
# latitude - from - 40 to 40

ext <- (c(-20, 60, -40, 40))

cl <- colorRampPalette(c("blue","green","red"))(100)  # ColorRampPalette in the RGB scale


# Africa crop
lst_africa_17 <- crop(lst_17, ext)    
lst_africa_18 <- crop(lst_18, ext) 
lst_africa_19 <- crop(lst_19, ext) 
lst_africa_20 <- crop(lst_20, ext) 
lst_africa_21 <- crop(lst_21, ext) 


 
 


-----------------------------------------------------------------------------

# plot with the global LST values for the 5 years

pdf("Land Surface Temperature - Global.pdf")


par(mfrow=c(3,2))
p1 <- plot(lst_17, col= cl, main= "LST  2017")
p2 <- plot(lst_18, col= cl, main= "LST  2018")
p3 <- plot(lst_19, col= cl, main= "LST  2019")
p4 <- plot(lst_20, col= cl, main= "LST  2020")
p5 <- plot(lst_21, col= cl, main= "LST  2021")

dev.off()




# plotting the data all together so we can compare them in our region of interest

pdf("Land Surface Temperature - Africa.pdf")

par(mfrow=c(3,2))
q1 <- plot(lst_africa_17, col= cl, main= "LST Africa 2017")
q2 <- plot(lst_africa_18, col= cl, main= "LST Africa 2018")
q3 <- plot(lst_africa_19, col= cl, main= "LST Africa 2019")
q4 <- plot(lst_africa_20, col= cl, main= "LST Africa 2020")
q5 <- plot(lst_africa_21, col= cl, main= "LST Africa 2021")

dev.off()

---------------------------------------------------------------------------------------------------------------------------------


# Analysing th results from the graphs above #
------------------------------------------------------------------------------------

# pt. 2 - relating the variation of temperature to some of the vegetation index variables #


# with the rising of temperatures, it's expected to notice a dicrease in the "LAI" values

# This is what we're about to analyse and try to verify!!

# we're going to import and use the data from copernicus about the LAI variable regarding Africa on those years:

# setting the working directory  

library(raster)
library(ncdf4)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

setwd("C:/lab//exam/")


lailist  <- list.files(pattern="LAI") 
lailist

# results:
[1] "c_gls_LAI300_201711200000_GLOBE_OLCI_V1.1.2.nc"  
[2] "c_gls_LAI300_202110310000_GLOBE_PROBAV_V1.0.1.nc"


lai_rast <- lapply(lailist, raster)
lai_rast

laistack <- stack(lai_rast)  
laistack

lai_17 <- laistack$Leaf.Area.Index.333m.1
lai_21 <- laistack$Leaf.Area.Index.333m.2



cut <- (c(-20, 60, -40, 40)
cl <- colorRampPalette(c("navajowhite","yellow","yellowgreen", "darkgreen"))(100)
        
# Africa crop:       
lai_africa_17 <- crop(lai_17, cut)
lai_africa_21 <- crop(lai_21, cut)



# plotting the LAI graphs together!!

pdf(" LAI Global.pdf")  
        
par(mfrow=c(2,1))
k1 <- plot(lai_17, col= cl, main= "LAI  2017")
k2 <- plot(lai_21, col= cl, main= "LAI  2021")
        
dev.off()

# plotting the values of our variable for our region of study (Africa):

par(mfrow=c(2,1))
s1 <- plot(lai_africa_17, col= cl, main= "LAI Africa -  2017")
s2 <- plot(lai_africa_21, col= cl, main= "LAI Africa -  2021")

# Analysing the data by their histograms:
        
par(mfrow=c(2,1))  
hist(lai_africa_17)
hist(lai_africa_21)

        
 # Linear Regression:







