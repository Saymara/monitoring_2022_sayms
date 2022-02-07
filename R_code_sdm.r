# Species Distribution Modelling

install.packages("sdm")
install.packages("rgdal")

library(sdm)
library(raster) # predictors (environmental variable which can predict where the species can be found)
library(rgdal) # species

# species data 

file <- system.file("external/species.shp", package="sdm")  # this function is going to make the list with the files(data) inside the package we're using (sdm)

file

species <- shapefile(file) # the shapefile function corresponds exatcly to the raster function for raster files but with shapefiles (that means it allows us to import data as well)
species

species$Occurrence # looking at the occurrences



# how many occurrences are there?

species[species$Occurrence == 1,]

presences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]

# plotting our data!!
 
plot(species, pch=19)
lot(presences, pch=19, col="blue")
 
# plot with presences and absences

plot(presences, pch=19, col="blue")
points(absences, pch=19, col="red") # this function allows us to represent both presences and absences together in the plot


# let's look at the predictors

path <- system.file("external", package="sdm")

# list the predictors

lst <- list.files(path, pattern='asc', full.names=T)
lst

 # you can use the lapply function with the raster function 
 
 preds <- stack(lst)   # the stack function concatenates multiple vectors into a single vector along with a factor indicating where each observation originated.
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

# day 2 (11 - 1 - 2022)

# model

setwd("C:/lab/")

source("R_code_source_sdm.r")   # this function (source) allows us to import/ recall the data from our working directory (lab folder) into R

# in the theoretical slides of SDMs we sghuld use individuals
preds

# these are the predictors: elevation, precipitation, temperature, vegetation

# Let's explain to the model what are the traning and and predictors data (set the data for the sdm)
# here we are basically asking the function (datasdm) to show us our  object (species) and the predictors (variables that influence the probability of the variable to be present or absent in a certain area in some sort of classification data ; (Creates a sdmdata objects that holds species (single or multiple) and explanatory variates. In addition, more information such as spatial coordinates, time, grouping variables, and metadata (e.g., author, date, reference, etc.) can be included);

datasdm <- sdmData(train=species, predictors=preds) 
datasdm

# model

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

#  prediction: map probability ( the raster output layer)

p1 <- predict(m1, newdata=preds)

# plot the output

plot(p1, col=cl)
points(presences, pch=19)

# stack everything together
s1 <- stack(preds, p1)
plot(p1, col=cl)


# Do you want to change names in the plot of the stack?
# choose a vector of names for the stack, looking at the previous graph, which are:

names(s1) <- c('Elevation', 'Precipitation', 'Temperature', 'Vegetation', 'Probability')

# and then replot!:

plot(s1, col=cl)



---------------------- \\ --------------- || ------------------- // ------------------------ || --------------------- \\ --------------- || ------------------- // ------------------------



