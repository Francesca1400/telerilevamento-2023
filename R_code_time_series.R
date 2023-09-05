# Time series analysis
# Set the working directory 
setwd( "C:/Lab/Greenland" )

# Importing the 4 file in Greenland
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# Plotting
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Create a par with the 4 images in chronological 
# order based on the year of the survey
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Creating the list
lst_2000 <- raster("lst_2000.tif")
ls()
rlist <- list.files (pattern = "lst")
rlist

# Using of lapply function helps us in applying functions on 
# list objects and returns a list object of the same length
import <- lapply(rlist, raster)
import

# Using of stack function used to transform data available in the form
# of separate columns within a data frame or a list into a single column
TGr <- stack(import)
TGr
plot(TGr)

# Plotting RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")

# Levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)


# --------------------------------
# Excercise 2: measured NO2 during the lockdown period 
# Importing file

# Set the working directory and upload the necessary files
setwd ("C:/lab/EN")
EN01 <- raster("EN_0001.png")

# Create colorRampPalette and plotting 
cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(EN01, col=cl)

# Import all files
rlist <- list.files(pattern="EN")

# lapply(X,FUN)
rimp <- lapply(rlist, raster)

#Stack
it <- stack(rimp)

# Plotting
plot(it, col=cl)

# Check 1
par(mfrow = c(1,2))
plot(EN01, col=cl)
plot(it[[1]], col=cl)

# Check 2
difcheck <- EN01 - it[[1]]
difcheck
plot(difcheck)

# First and last data
par(mfrow=c(1,2))
plot(it[[1]], col=cl)
plot(it[[13]], col=cl)

# Difference
difen = it [[1]]- it [[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)

# "PlotRGB" of three files together
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")


