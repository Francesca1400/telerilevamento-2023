# 3D in R

#Set the working directory
setwd("C:/Lab/dati") #Windows

#Recall the packages
library(raster)
library(ggplot2)
library(viridis)
library(patchwork)

# Import the image
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013

# Create a dataframe
dsm_2013d <- as.data.frame(dsm_2013, xy=T)
head(dsm_2013d)

# Plotting 
ggplot()+
  geom_raster(dsm_2013d, mapping=aes(x=x, y=y, fill=X2013Elevation_DigitalElevationModel.0.5m))+
  scale_fill_viridis()+
  ggtitle("dsm 2013")

# Now let's create the soil model
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")
dtm_2013
dtm_2013d <- as.data.frame(dtm_2013, xy=T)
head(dtm_2013d)

# Let's now rename the file
names(dtm_2013d) <- c("x", "y", "z")

# Plotting
ggplot()+
  geom_raster(dtm_2013d, mapping=aes(x=x, y=y, fill=z))+
  scale_fill_viridis(option = "magma")+
  ggtitle("dtm 2013")

p1 <- ggplot()+
  geom_raster(dsm_2013d, mapping=aes(x=x, y=y, fill=X2013Elevation_DigitalElevationModel.0.5m))+
  scale_fill_viridis()+
  ggtitle("dsm 2013")

p2 <- ggplot()+
  geom_raster(dtm_2013d, mapping=aes(x=x, y=y, fill=z))+
  scale_fill_viridis(option = "magma")+
  ggtitle("dtm 2013")

p3 <-ggplot()+
  geom_raster(chm2013d, mapping=aes(x=x, y=y, fill=layer))+
  scale_fill_viridis()+
  ggtitle("dtm 2013")

# With the "patchwork" function I join the 3 plots
p1 + p2 + p3
