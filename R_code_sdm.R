# R code for species distribution modelling
# Install packages
install.packages("sdm")
install.packages("rgdal", dependencies = T)

# Image into "file" the data that was downloaded as "shp", 
# using the right function via previously downloaded packages
file <- system.file("external/species.shp", package="sdm")
file
species <- shapefile(file)

# Plotting taking into account that 0 are absences and 1 are attendances
plot(species)
precences <- species[species$Occurrence == 1,]
precences
plot(precences, col= "blue", pch=19)
absences <- species [species$Occurrence == 0,]
absences
plot(absences, col= "red", pch=19)

# Plotting presences and absences together
plot(precences, col= "blue", pch=19)
points(absences, col= "red", pch=19)

# Predictors
# "path" is used to fill in the directory separator.
path <- system.file ("external", package = "sdm")

# List the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) 
lst
preds <- stack(lst)

# Plotting 
plot(preds)

# Plotting with RampPalette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# Plot predictors respect to elevation
plot(preds$elevation, col=cl)
points(presences, pch=19)

# Plot predictors respect to temperature
plot(preds$temperature, col=cl)
points(presences, pch=19)

# Plot predictors respect to precipitation
plot(preds$precipitation, col=cl)
points(presences, pch=19)

# Plot predictors respect to vegetation
plot(preds$vegetation, col=cl)
points(presences, pch=19)

# Linear model
# Set the data
datasdm <- sdmData(train = species, predictors = preds)
datasdm

# Model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
m1

# Make the raster output layer
p1 <- predict(m1, newdata=preds)

# Plotting
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# Add to the stack
s1 <- stack(preds,p1)
names(s1) [5] <- "model"
plot(s1, col=cl)



