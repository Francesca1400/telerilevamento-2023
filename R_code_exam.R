# Hi everyone! I'm Francesca and this is my exam project for the geoecological remote sensing course of professor D. Rocchini. 
# The project explains how the vegetation has changed due to the high temperatures of the summer months (May and July) 
# and the fires that occurred in August in the Belmonte area and in the areas close to the city of Palermo.

# Data from: https://scihub.copernicus.eu/

# First set the working directory
setwd("C:/Lab/") # For Windows

# We install the necessary packages and then recall them with via the library

install.packages("raster")
install.packages("ggplot2")
install.packages("patchwork")
library(raster) #Reading, writing, manipulating, analyzing and modeling spatial data.
library(ggplot2) # For graphs
library(patchwork) # To insert two different charts within the same chart

# Data may 7

# We now import the various bands taking into account that: Import the red bands (B04), 
# green (B03), blue (B02) and nir (B08) and stack them into one object

lst075 <- list.files(pattern="T33SUC_202305")
import075 <- lapply(lst075, raster)
i075 <- stack(import075)

# Data july 6

lst067 <- list.files(pattern="T33SUC_202307")
import067 <- lapply(lst067, raster)
i067 <- stack(import067)

# Data august 25

lst258 <- list.files(pattern="T33SUC_202308")
import258 <- lapply(lst258, raster)
i258 <- stack(import258)

# Now let's plot in RGB to have our images with natural colors

plotRGB(i075, 3, 2, 1, stretch="lin")
plotRGB(i067, 3, 2, 1, stretch="lin")
plotRGB(i258, 3, 2, 1, stretch="lin")

# Now I crop the image highlighting only the part that interests us
# Crop 1 (may)

e <- extent(3e+05, 391170, 4202370, 4240420)
may <- crop(i075, e)
plotRGB(may, 3, 2, 1, stretch="lin")

#Crop 2 (july)

july <- crop(i067, e)
plotRGB(july, 3, 2, 1, stretch="lin")

#Crop 3 (august)

august <- crop(i258, e)
plotRGB(august, 3, 2, 1, stretch="lin")

# Let's now make a par in which we insert the three images relating to 
# the three different months in which the degenerative state of the vegetation is clearly visible

par(mfrow= c(3,1))
plotRGB(may, 3, 2, 1, stretch="lin")
plotRGB(july, 3, 2, 1, stretch="lin")
plotRGB(august, 3, 2, 1, stretch="lin")
dev.off()

#-------------------------------------------------------------------------------------------------------------------
#### Qualitative analysis of vegetation health by calculating DVI and NDVI

### Let's now calculate the DVI taking into account that:

# Band 4 = NIR
# Band 3 = red
# The calculation to be made for the DVI is therefore NIR-red in order to inspect 
# the nutritional status of the vegetation following the rise in temperatures and the fires in the month of August

# 1. DVI of the month of May

dvimay = may[[4]] - may [[3]]
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvimay, col=cl)

# 2. DVI of the month of July

dvijuly = july[[4]] - july [[3]]
plot(dvimay, col=cl)

# 3. DVI of the month of August

dviaugust = august[[4]] - august [[3]]
plot(dvimay, col=cl)

# I now create a par in which I insert the 3 images of the different
# DVIs relating to the various months

par(mfrow = c(1,3))
plot(dvimay, col=cl)
plot(dvijuly, col=cl)
plot(dviaugust, col=cl)
dev.off()

### Let's now calculate the NDVI

# 1. NDVI of the month of May

ndvimay = dvimay/(may[[4]] + may[[3]])
plot(ndvimay, col=cl)

# 2. NDVI of the month of July

ndvijuly = dvijuly/(july[[4]] + july[[3]])
plot(ndvijuly, col=cl)

# 3. NDVI of the month of August

ndviaugust = dviaugust/(august[[4]] + august[[3]])
plot(ndviaugust, col=cl)

# I now create a par in which I insert the 3 images of the different
# NDVIs relating to the various months

par(mfrow = c(1,3))
plot(ndvimay, col=cl)
plot(ndvijuly, col=cl)
plot(ndviaugust, col=cl)
dev.off()

# Let's now evaluate, with the difference between the NDVI for the month of May and the
# NDVI for the month of August, how the health status of the vegetation has changed

cld <- colorRampPalette(c('blue', 'white', 'red')) (100)
difndvi = ndvimay - ndviaugust
plot(difndvi, col=cld)

#### ----------------------------------------------------------------------------------------------
### Classification 

## 1) Get all the single values for individual months

singlenrmay <- getValues(may)
singlenrmay

singlenrjuly <- getValues(july)
singlenrjuly

singlenraugust <- getValues(august)
singlenraugust

# 2) Classify
# "kmeans" clustering used unsupervised machine learning algorithm 
# for partitioning a given data set into a set of k groups

kclustermay <- kmeans(singlenrmay, centers = 3)
kclusterjuly <- kmeans(singlenrjuly, centers = 3)
kclusteraugust <- kmeans(singlenraugust, centers = 3)

# 3) Set values to a raster on the basis of so

classmay <- setValues(may[[1]], kclustermay$cluster)
classjuly <- setValues(july[[1]], kclusterjuly$cluster)
classaugust <- setValues(august[[1]], kclusteraugust$cluster)

# PLotting with RampPalette

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(classmay, col=cl)
plot(classjuly, col=cl)
plot(classaugust, col=cl)

dev.off()

#Par for comparation

par(mfrow= c(1,3))
plot(classmay, col=cl)
plot(classjuly, col=cl)
plot(classaugust, col=cl)

dev.off()

### Let's calculate the number of pixels associated to each class to evaluate the covered area
# 1 -> relating to the month of May
# 2 -> relating to the month of July
# 3 -> relating to the month of August

frequenciesmay <- freq(classmay)
tot1 = ncell(classmay)
tot1  # tot1 = 34690185
percentages1 = frequenciesmay * 100 /  tot1
percentages1

#             value     count
# [1,] 2.882660e-06  6.677191 #burnt soil
# [2,] 5.765319e-06 58.759101 #water
# [3,] 8.647979e-06 34.563707 #vegetation

frequenciesjuly <- freq(classjuly)
tot2 = ncell(classjuly)
tot2  #tot2 = 34690185
percentages2 = frequenciesjuly * 100 /  tot2
percentages2

#             value    count
# [1,] 2.882660e-06  7.11132 #burnt soil
# [2,] 5.765319e-06 58.70650 #water
# [3,] 8.647979e-06 34.18218 #vegetation

frequenciesaugust <- freq(classaugust)
tot3 = ncell(classaugust)
tot3 #tot3 = 34690185
percentages3 = frequenciesaugust * 100 /  tot3
percentages3

#            value    count
# [1,] 2.882660e-06 10.86722 #burnt soil
# [2,] 5.765319e-06 59.14084 #water
# [3,] 8.647979e-06 29.99195 #vegetation

### Let's create a dataframe that represents the results obtained

cover <- c("Burnt soil", "Water ", "Vegetation")
percent_may <- c(6.68, 58.75, 34.56)
percent_july <- c(7.11, 58.70, 34.20)
percent_august <- c(10.90, 59.14, 30.00)
percentages <- data.frame(cover, percent_may, percent_july, percent_august)
percentages

# Plotting with ggplot2

ggplot(percentages, aes(x=cover, y=percent_may, color=cover)) + geom_bar(stat="identity", fill="white") # may
ggplot(percentages, aes(x=cover, y=percent_july, color=cover)) + geom_bar(stat="identity", fill="white") # july
ggplot(percentages, aes(x=cover, y=percent_august, color=cover)) + geom_bar(stat="identity", fill="white") # august

dev.off()
p1 <- ggplot(percentages, aes(x=cover, y=percent_may, color=cover)) + geom_bar(stat="identity", fill="white") +
  ggtitle(" May 2023") + ylim(c(0,100))
p1

p2 <- ggplot(percentages, aes(x=cover, y=percent_july, color=cover)) + geom_bar(stat="identity", fill="white")+
  ggtitle(" July 2023") + ylim(c(0,100))
p2

p3 <- ggplot(percentages, aes(x=cover, y=percent_august, color=cover)) + geom_bar(stat="identity", fill="white") +
  ggtitle(" August 2023") + ylim(c(0,100))
p3

# Let's now use the patchwork to merge into 3 graphs and evaluate the situation as a whole
p1+p2+p3

#### After comparing the histograms and evaluating the percentages, it is clear that the conclusions relating to the study carried out are:
### We can therefore note that, except for the surface of the water which has remained the same:
# The percentage of soil burned increased during the 3 months of observation and it is hoped that
# as the months pass the situation improves with the drop in temperatures.
# The percentage of vegetation has instead decreased precisely due to these 
# harsh environmental situations that have affected all of Sicily

