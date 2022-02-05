# Ice melt in Greenland
# Proxy: LST

library(raster)
library(ggplot2)
library(RStoolbox)
library(patchwork)
library(viridis)


# set the working directory
setwd("C:/lab/greenland") 

# listing the files:
rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist, raster)  # applying the raster function to all the files that were generated from the pattern "lst"
import

temp_greenland <- stack(import)      # compilating all the single four files from above in only one list
temp_greenland
plot(temp_greenland)


cl <- colorRampPalette(c("blue","light blue","pink","yellow"))(100)
plot(temp_greenland, col=cl)

# ggplot of first and final images 2000 vs 2015
# ggplot is the function that opens our image's "window"

p1 <- ggplot() + 
geom_raster(temp_greenland$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) +
scale_fill_viridis(option="magma") + ggtitle("LST in 2000")

p2 <- ggplot() + 
geom_raster(temp_greenland$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) +
scale_fill_viridis(option="magma") + ggtitle("LST in 2015")

# plotting them together, one beside the other
p1 + p2 


# let's see the frequency distribution of data

par(mfrow=c(1,2))   # building a data frame with the 2 histograms
hist(temp_greenland$lst_2000)
hist(temp_greenland$lst_2015)


par(mfrow=c(2,2))   
hist(temp_greenland)

plot(temp_greenland$lst_2010,temp_greenland$lst_2015, xlim=(c(12500,15000)), ylim=(c(12500,15000)))

# let's do a regression graph!
abline(0,1, col="red")


# make a plot with all the histograms and relatives regressions
   
pairs(temp_greenland)      # stands for creating a matrix for several plots
 






