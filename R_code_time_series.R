# Time series analysis
setwd( "C:/Lab/Greenland" )

#Importing the 4 file in Greenland
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#Plotting
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#creating the list
lst_2000 <- raster("lst_2000.tif")
ls()
rlist <- list.files (pattern = "lst")
rlist
#using of lapply function
import <- lapply(rlist, raster)
import

# using of stack function
TGr <- stack(import)
TGr
plot(TGr)

#plotting RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")

# levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)


#Excercise 2: measured NO2 during the lockdown period 
#Importing file

setwd ("C:/lab/EN")
EN01 <- raster("EN_0001.png")

#colorRampPalette and plotting
cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(EN01, col=cl)

#import all files
rlist <- list.files(pattern="EN")
rimp <- lapply(rlist, raster)
it <- stack(rimp)
#plotting
plot(it, col=cl)

#check
par(mfrow = c(1,2))
plot(EN01, col=cl)
plot(it[[1]], col=cl)

#check 2
difcheck <- EN01 - it[[1]]
difcheck
plot(difcheck)

#first and last data
par(mfrow=c(1,2))
plot(it[[1]], col=cl)
plot(it[[13]], col=cl)

#difference
difen = it [[1]]- it [[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)

# plotRGB of three files together
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")


