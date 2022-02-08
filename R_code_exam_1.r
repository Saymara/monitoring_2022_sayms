# We're about to analyse the ....

library(raster)
library(ncfd4)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

# setting the working directory

setwd("C:/lab//exam/")

# importing all the data downloaded from Copernicus together with the lapply function
# first of all, once we have more than one data in our directory, let's create a list with all the files downloaded using the "list.files" function

albhlist  <- list.files(pattern="ALBH") 
albhlist

# results:
[1] "c_gls_ALBH_199912130000_GLOBE_VGT_V1.4.1 (1).nc"
[2] "c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc" 


# Now let's create a list where each element is the result of applying the "raster" function to its correspondent element in rlist (object) using the "lapply" function

albh_rast <- lapply(albhlist, raster)
albh_rast


# With the "stack" function let's compilate all the data from the previous list only one list

albhstack <- stack(albh_rast)  
albhstack


albh_1999 <- lststack$Fraction.of.Valid.Observations.1
albh_2020 <- lststack$Fraction.of.Valid.Observations.2
