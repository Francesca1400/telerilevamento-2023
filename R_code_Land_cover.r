install.packages(ggplot2)
library(ggplot2)   #for ggplot graphs
library(raster)
setwd("C:/lab/")

defor1 <- brick("defor1_.png")
defor2 <- brick("defor2_.png")

#PLotting RGB
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#Classification defor1
#Get all the single values
singlenr1 <- getValues(defor1)
singlenr1

#Classify with kmeans
kcluster1 <- kmeans(singlenr1, centers = 2)
kcluster1

#Recreating an image
defor1class <- setValues(defor1[[1]], kcluster1$cluster)

#Plotting
plot(defor1class)
#Class1: forest
#Class2: bare soil

#Classification defor2
#1 step
singlenr2 <- getValues(defor2)
singlenr2

#2 step
kcluster2 <- kmeans(singlenr2, centers = 2)
kcluster2

#3 step 
defor2class <- setValues(defor2 [[1]], kcluster2$cluster)

#Plotting
plot(defor2class)

#Class1: forest
#Class2 : agricolture

#For multiframes with ggplot2
install.packages("patchwork")
library(patchwork)



