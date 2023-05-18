Species distribution modelling
#Install packages
install.packages("sdm")
install.packages("rgdal", dependencies = T)
file <- system.file("external/species.shp", package="sdm")
file
species <- shapefile(file)

#plotting
plot(species)

precences <- species[species$Occurrence == 1,]
precences
plot(precences, col= "blue", pch=19)
absences <- species [species$Occurrence == 0,]
absences
plot(absences, col= "red", pch=19)

#Plotting presences and absences
plot(precences, col= "blue", pch=19)
points(absences, col= "red", pch=19)

path <- system.file ("external", package = "sdm")
path

#list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) 
lst
preds <- stack(lst)

#Plotting
plot(preds)

#Plotting with RampPalette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#plot predictors respect to elevation
plot(preds$elevation, col=cl)
points(presences, pch=19)

#plot predictors respect to temperature
plot(preds$temperature, col=cl)
points(presences, pch=19)

#plot predictors respect to precipitation
plot(preds$precipitation, col=cl)
points(presences, pch=19)

#plot predictors respect to vegetation
plot(preds$vegetation, col=cl)
points(presences, pch=19)

#model
#set the data
datasdm <- sdmData(train = species, predictors = preds)
datasdm

#model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
m1

# make the raster output layer
p1 <- predict(m1, newdata=preds)

# plotting
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

#stack
s1 <- stack(preds,p1)
plot(s1, col=cl)



