# R coding for chemical  cycling studying
# time series of NO2 change in Europe during the pandemic

library(raster)

# set the working directory

setwd("C:/lab/en/")  

en01 <- raster("EN_0001.png")
# what's the range?
en01

cl <- colorRampPalette(c('red','orange','yellow'))(100) 

# plot the the NO2 values of January 2020 by the cl palette
plot(en01, col=cl)

# Exercise: import the end of March NO2 and plot it

en13 <- raster("EN_0013.png")
plot(en13, col=cl)

par(mfrow=c(2,1))
plot(en01,col=cl)
plot(en13,col=cl)

# import all the images
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")


 # plot all the data together
 par(mfrow=c(4,4)
 [10:26 AM] Duccio Rocchini
# plot all the data together

par(mfrow=c(4,4))

plot(EN01, col=cl)

plot(EN02, col=cl)

plot(EN03, col=cl)

plot(EN04, col=cl)

plot(EN05, col=cl)

plot(EN06, col=cl)

plot(EN07, col=cl)

plot(EN08, col=cl)

plot(EN09, col=cl)

plot(EN10, col=cl)

plot(EN11, col=cl)

plot(EN12, col=cl)

plot(EN13, col=cl)


 
# plot the stack together

EN <- stack(EN01, EN02, EN03, EN04, EN05, EN06, EN07, EN08, EN09, EN10, EN11, EN12, EN13)

# plot the stack all together
plot(EN,col=cl)

# plot only the first image of the stack

EN
plot(EN$EN_0001, col=cl)

# RGB space 

plotRGB(EN, r=1 ,g=7,  b=13, stretch="lin") # in the r band are represented all the areas with highest amounts of NO2 in January and so on

     
   ------ # day 2 -------

# pairs
pairs(EN)
     
# direct import
     
library(raster)
setwd("C:/lab/en/")  
     
     
# importing all the data together with the lapply function

  rlist <-list.files(pattern="EN")  # creating a list of the data (files/images) we want to import
  rlist
  
     
  list_rast <- lapply(rlist,raster)
         
   list_rast 
     
   EN_stack <- stack(list_rast)
   EN_stack
     
     cl <- colorRampPalette(c('red','orange','yellow'))(100) 
     plot(EN_stack,col=cl)
     
     # exercise: plot only the first image of the stack
     plot(EN_stack$EN_0001,col=cl)
     
     
     
     # difference
     
     ENdif <- EN_stack$EN_0001 - EN_stack$EN_0013
     cldif <- colorRampPalette(c('blue','white','red'))(100) 
     plot(ENdif, col=cldif)
   
  # automated processing source function
     
     source("r_script.txt")
     
     
     
     
     
     
     

     
     
     
