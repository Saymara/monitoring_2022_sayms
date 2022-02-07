# R_code_multivar.r

install.packages("vegan")
library(vegan)

# setting the working directory 

setwd("C:/lab/")

load("biomes_multivar.RData")  # reloads datasets written with the function save
ls()

# plot per species matrix

head(biomes)    # the head function returns the first or last parts of a vector, matrix, table, data frame or function

multivar <- decorana(biomes)   # makes a correspondence analysis and basic reciprocal averaging or orthogonal correspondence analysis
multivar

plot(multivar)

# biomes names in the graph:

attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)


pdf("multivar.pdf")

plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

dev.off()
