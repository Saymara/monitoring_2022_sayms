# R code for ecosystem monitoring by remote sensing
# First of all we need to install some packages
# raster package to manage image data
# https://cran.r-project.org/web/packages/raster/index.html

install.packages("raster") 

library(raster)

install.packages("terra")

setwd("C:/lab/")    # the function setwd stands for exporting data from a directory (lab folder in this case) that is outside of R
library(raster)
# we are going to import sattelite data
# using quotes cause we're going outside R
l2011 <- brick("p224r63_2011.grd")
#objects can not be numbers
#need to use the library function again to attach the package

l2011
plot(l2011)


# B1 is the refletance in the blue band
# B2 is the refletance in the green band
# B3 is the refletance in the red band 

plot(l2011$B1_sre)

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

plotRGB(l2011, r=3, g=2,  b=1, stretch="Lin")


