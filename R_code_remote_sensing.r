# R code for ecosystem monitoring by remote sensing
# First of all we need to install some packages
# raster package to manage image data
# https://cran.r-project.org/web/packages/raster/index.html

install.packages("raster") 

library(raster)

install.packages("terra")

----------------------------------------------------------------------------------------------------------------------------------

setwd("C:/lab/")    # the function setwd stands for exporting data from a directory (lab folder in this case) that is outside of R
library(raster)

# we are going to import sattelite data
# using quotes cause we're going outside R (to get the data)
# the brick function is used to import sattelite images
l2011 <- brick("p224r63_2011.grd")
#objects can not be numbers
#need to use the library function again to attach the package

l2011           # our sattelite image
plot(l2011)


# B1 is the refletance in the blue band
# B2 is the refletance in the green band
# B3 is the refletance in the red band 


# let's plot the green band
plot(l2011$B2_sre)  

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B2_sre, col=cl)

plotRGB(l2011, r=3, g=2,  b=1, stretch="Lin")

#change the colorramppalette with dark green, light green, e.g clg

clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg)


# now let's plot the blue band using the colorRampPalette  function


clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col=clb)


# let's plot both images in just on multiframe graphs (it is necessary to create both plot and colorRampPalette functions b4  doing the multiframe)

par(mfrow=c(1,2))

#plot the blue band
plot(l2011$B1_sre, col=clb)

#plot the green band
plot(l2011$B2_sre, col=clg)

# now with 2 rows and 1 column
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# Exercise: Plot the first 4 bands with 2 rows and 2 columns (remember to create the plot function and the colorRampPalette for each band after the multiframe function)

par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red", "red", "deeppink2")) (100)
plot(l2011$B3_sre, col=clr)

clinr <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clinr)

 # dev.off()

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") # natural colours

 # switching bands
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")  # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")  # false colours


# putting the images in a multiframe graph
par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") # natural colours
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")  # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")  # false colours



