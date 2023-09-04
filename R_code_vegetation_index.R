# Calculating spectral indices

library(raster)
setwd("C:/lab/") 

# Excersise: import defor1_.png
l1992 <- brick("defor1_.png")
l1992

# Excersise: plot the image via plotRGB
plotRGB(l1992, 3, 2, 1, stretch="Lin")

# What is NIR?
# NIR = 1
# RED = 2
# GREEN = 3

# Excersise: calculate DVI for 1992
dvi1992 = l1992[[1]] - l1992[[2]]
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col=cl)

#Excercise: plot the image from 1992 ontop of that of 2006
par(mfrow = c(2,1))
plotRGB(l1992, 1, 2, 3, stretch="Lin")
plotRGB(l2006, 1,2,3, stretch="Lin")

#dvi 1992
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992

#dvi2006
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

#difference between dvi1992 and dvi2006
difdvi<- dvi1992-dvi2006
plot(difdvi)

#Range DVI (8 bit): -255 a 255
#Range DVI (16 bit): -65535 a 65535
#Range NDVI: -1; 1

# Calculating NDVI 1992 and NDVI2006

ndvi1992 = dvi1992/ (l1992[[1]]+ l1992[[2]])
ndvi2006 = dvi2006/ (l2006[[1]]+ l2006[[2]])
ndvi1992
ndvi2006

#Plotting
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)

#Difference between two NDVI
difndvi= ndvi1992 - ndvi2006
difndvi

#Plotting
plot(difndvi, col=cld)




