# R code for estimating energy in ecosystem

# install the raster & rgdal packages:
# install.packages("raster")
# install.packages("rgdal")

library(raster)
library(rgdal)


# set the working directory

setwd("C:/lab/")


# importing the data
l1992 <- brick("defor1_.jpg")   # image of 1992 (sattelite image)

l1992

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin") # we put the NIR in the red band   

 # day 2 (22/1/2021)

library(raster)
library(rgdal)

# now we import data from 2005
l2006 <- brick("defor2_.jpg")

l2006

# plotting the data ; the NIR is put in the red band as well 
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# now let's plot the images together
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")


# let's calculate the energy amount (high absorption = low reflectance)
# energy in 1992
dvi1992 <- l1992$defor1_.1 - l1992$defor1_.2   # defor1_.1is the first layer of the 1992 data that we imported
cl_1992 <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl_1992)

# energy in 2006
dvi2006 <- l2006$defor2_.1 - l2006$defor2_.2
cl_2006 <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2006, col=cl_2006)


# putting the 2 images together in a frame
par(mfrow=c(2,1))
plot(dvi1992, col=cl_1992)
plot(dvi2006, col=cl_2006)

# differecing two images in two different times
dvidif <- dvi1992 - dvi2006
# plot the results
cl_dvidif <- colorRampPalette(c('blue','white','red'))(100)
plot(dvidif,col=cl_dvidif)
                             
# final plot for this area : original images, dvis, final dvi difference

par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl_1992)
plot(dvi2006, col=cl_2006)
plot(dvidif,col=cl_dvidif)
plotRGB(l2006, r=3, g=2, b=3, stretch="Lin")

pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl_1992)
plot(dvi2006, col=cl_2006)
plot(dvidif,col=cl_dvidif)
plotRGB(l2006, r=3, g=2, b=3, stretch="Lin")
dev.off()

pdf("energy_1.pdf")
par(mfrow=c(3,1))
plot(dvi1992, col=cl_1992)
plot(dvi2006, col=cl_2006)
plot(dvidif,col=cl_dvidif)
dev.off()








