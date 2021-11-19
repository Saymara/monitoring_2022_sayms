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

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")







