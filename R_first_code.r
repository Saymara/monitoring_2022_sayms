# This is my first code in Github! Quite exciting, right? 

# Here are the input data
# Constanza data on streams
water <- c(100, 200, 300, 400, 500)
water

# Marta data on fishes genomes
fishes <- c(10, 50, 60, 100,200)
fishes

# plot the diversity of fishes (y) versus the amount of water (x)
# a function is used with arguments inside!
plot (water, fishes)

# the data we developed can be stored in a table
# a table in R is called data frame
streams  <- data.frame(water, fishes)  
streams

#From now on we are going to import and/or export data!
#setwd for Windows
setwd("C:/lab/")
 
 #Let's export our tables
write.table(streams, file="my_first_table.txt")

#Some colleagues did send us a table in R, how to import it in R?
read.table("my_first_table.txt")

#Let's assign it to an object inside R
saymstable <- read.table("my_first_table.txt")

#The first statistics for lazy beautiful people
summary(saymstable)

#Marta does not like water
#Marta wants to get info only on fishes
summary(saymstable$fishes)

#histogram
hist(saymstable$fishes)
hist(saymstable$water)





