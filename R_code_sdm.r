# Species Distribution Modelling

install.packages("sdm")
install.packages("rgdal")

library(sdm)
library(raster) # predictors (environmental variable which can predict where the species can be found)
library(rgdal) # species

# species data 

file <- system.file("external/species.shp", package="sdm")  # this function is going to make the list with the data inside the package ware using

file

species <- shapefile(file) # the shapefile function corresponds exatcly to the raster function for raster files (it allows us to import data)
species

species$Occurrence # looking at the occurrences



# how many occurrences are there?

species[species$Occurrence == 1,]

presences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]

 # plot! 
 
 plot(species, pch=19)
 plot(presences, pch=19, col="blue")
 
 # plot with presences and absences

plot(presences, pch=19, col="blue")
points(absences, pch=19, col="red") # this function allows us to represent both presences and absences together in the plot


# let's look at the predictors

path <- system.file("external", package="sdm")

lst <- list.files(path, pattern='asc', full.names=T)
lst

 # you can use the lapply function with the raster function 
 
 preds <- stack(lst)
 preds
 
 # plot preds
 
 cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
 plot(preds,col=cl)

# using the plot function here + the points with the presence object, allows us to interpret how the distribution of the species vary with the many types of environmental variables(vegetation, temperature...) 
plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)
  

---------------------- \\ --------------- || ------------------- // ------------------------ || --------------------- \\ --------------- || ------------------- // ------------------------

# day 2 (11 - 1 - 2021)

setwd("C:/lab/")
source("R_code_source_sdm.r")   # this function allows us to import data from our working directory (lab folder) into R

# in the theoretical slides of SDMs we sghuld use individuals
preds

# these are the predictors: elevation, precipitation, temperature, vegetation

# Let's explain to the model whar are the traning and and predictors data
datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glms")

