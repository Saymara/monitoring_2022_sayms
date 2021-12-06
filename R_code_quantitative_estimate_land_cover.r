    install.packages("RStoolbox") 
    library(RStoolbox)
    install.packages("ggplot2") 
    library(ggplot2)
    install.packages("gridExtra") 
    library(gridExtra)
     
   ------------------------------------------------
   
   library(raster)
   library(RStoolbox)
   library(ggplot2)
   
   setwd("C:/lab/")
    
    
   # brick (importing data)
   
   # 1 list the files available
   rlist <- list.files(pattern= "defor")
   rlist
   # 2 lapply: apply a function to a list
   list_rast <- lapply(rlist,brick)
   list_rast
   
   # basically, what we did was importing these 2 files separately
   
   
   plot(list_rast[[1]])
   
   # defor: NIR 1, red 2, green 3
   
   plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch = "lin")
   
   l1992 <- list_rast[[1]]
   plotRGB(l1992 , r=1, g=2, b=3, stretch = "lin")
   
   l2006 <- list_rast[[2]]
   plotRGB(l2006 , r=1, g=2, b=3, stretch = "lin")
   
   
   
   # Unsupervised classification
   
   l1992c <- unsuperClass(l1992, nClasses=2)
   l1992c
   
   plot(l1992c$map)
   
   # value 1 = agricultural areas and water
   # value 2 = forests
   
   freq(l1992c$map)  # it shows us the amount of value 1 and 2 in the classification
   
   # total amount of pixels
   
   total  <- 341292
   
   propagri <- 33662/total

   propforest <- 307630/total
   
   propagri
   propforest

   # agriculture and water :  0.09863108
   # forest : 0.9013689

  
  # build a data frame ( table )
  
  cover <- c("Forest", "Agriculture")
  prop1992  <- c( 0.09863108,  0.9013689)
  
  proportion1992  <- data.frame(cover, prop1992)
  proportion1992 
  
  
   
  ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")


# day 3 (december 6)  - kind of a revision

library(raster)
library(RStoolbox) 
library(ggplot2)

setwd("C:/lab/")


# 1 list the files available

rlist <- list.files(pattern="defor")

rlist

list_rast <- lapply(rlist, brick) # lapply(x, FUN)

list_rast


l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l1992c <- unsuperClass(l1992, nClasses=2) # unsuperClass(x, nClasses)


plot(l1992c$map)

# value 2 = agricultural areas and water
# value 1 = forests

freq(l1992c$map)

total <- 342726

#  value  count
# [1,]     1 306470
# [2,]     2  34822


propagri<- 34822/total
propforest<- 306470/total


# build a dataframe (table)

cover <- c("Agriculture", "Forest")
prop1992 <- c(propagri, propforest)

proportion1992  <- data.frame(cover,prop1992)

-----------------------------------------------

l2006 <- list_rast[[2]]

l2006c <- unsuperClass(l2006, nClasses=2) # unsuperClass(x, nClasses) 

l2006c

freq(l2006c$map)
#   value  count
# [1,]     1 178304
# [2,]     2 164422




total <- 3342726 

propagri<- 178304/total

propaforest <- 3164422/total

cover <- c("Agriculture", "Forest")
prop2006 <- c(propagri, propforest)


proportion2006 <- data.frame(cover, prop2006)

proportion <- data.frame(cover, prop1992, prop2006)


--------------------------------

library(gridExtra)

# plotting all together

p1 <- ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")
 
grid.arrange(p1, p2, nrows=1)
 














   
   
 
   
   
  
     
    
