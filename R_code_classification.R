# Classification of remote sensing data via RStoolbox

# Installing devtools
install.packages("raster")
install.packages("devtools")
install.packages("RStoolbox")

# Recall the packages with library
library(devtools)
library(raster)
library(RStoolbox)

# Set working directory
setwd("C:/lab/")  #Windows

# Data import with brick function
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Plotting with two different stretch
plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# Classifying the solar data

# 1) Get all the single values
singlenr <- getValues(so)
singlenr

# 2) Classify
# "kmeans" clustering used unsupervised machine learning algorithm 
# for partitioning a given data set into a set of k groups
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3) Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) 

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# -------------------------
# Grand Canyon data

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# red = 1
# green = 2
# blue = 3

# Plotting RGB
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# Crop the imagine
gcc <- crop (gc, drawExtent()) # "crop" returns a geographic subset of an object
plotRGB(gcc, 1, 2, 3, stretch= "lin")

# Classification

# 1) Get values
singlenr <- getValues(gc)
singlenr

# 2) Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3) Set values
gcclass <- setValues(gc[[1]], kcluster$cluster)

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)

# Let's calculate the frequency
frequencies <- freq(gcclass)
total = ncell(gcclass)
total
tot = 58076148

# Let's calculate the percentages
percentages = frequencies * 100 /  tot
