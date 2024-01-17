# Recall the packages from the library
library (raster)
library(ggplot2)

# Install viridis packages
install.packages("viridis")
library(viridis)

# Set the working directory
setwd("C:/Lab/") # Windows

# Import image
sen <- brick("sentinel.png")
plot(sen) 

# Plotting RGB
RGB(sen, 1, 2, 3, stretch ="lin")

plonir <- sen[[1]]
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)

# Plotting
plot(sd3) 

# Now plotting with ggplot2
# "ggploot2" is a R package dedicated to data visualization
# which allows us to make our graphs more complete
sd3d <- as.data.frame(sd3, xy=TRUE)
ggplot()+ 
  geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))

# Plotting with ggplot2 and viridis
ggplot()+
  geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))+
  scale_fill_viridis()
  
ggplot()+
  geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))+
  scale_fill_viridis(option="magma")
  
# Now add the title
 ggplot()+
  geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))+
  scale_fill_viridis(option="magma")+
  ggtitle("Standard deviation via the magma colour scale")
  
# Use patchwork to merge different ggplots within the same plot
# Viridis
p1 <- ggplot()+
   geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))+
   scale_fill_viridis()
   ggtitle("Standard deviation via the viridis colour scale")
  
# Inferno
p2 <- ggplot()+
   geom_raster(sd3d, mapping = aes(x=x, y=y, fill=layer))+
   scale_fill_viridis(option="inferno")+
   ggtitle("Standard deviation via the inferno colour scale")
p1 + p2

# Excercise: plot the original image (NIR) and its standard deviation
nird <- as.data.frame(nir, xy=T)
p3 <- ggplot()+
  geom_raster(nird, mapping = aes(x=x, y=y, fill=sentinel_1))+
  scale_fill_viridis(option="cividis")+
  ggtitle("NIR deviation via the cividis colour scale")
p3
p3 + p1

  

  

