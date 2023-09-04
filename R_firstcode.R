# My first code in GitHub
# Let's install the raster package

install.packages("raster")
library("raster")

# Setting working directory
setwd("C:/Lab/")

# The "brick" function allows us to create a RasterBrick which is a multi-layered raster object, 
# pointing only to a single file with shorter processing times than the RasterStack. We usually use 
# to store our data all together in one file
l2011 <- brick("p224r63_2011_masked.grd)

# Plotting the data
plot(l2011)

# Now let's change the color of our graph by creating a special palette
clb <- colorRampPalette(c("red", "orange", "yellow")) (100) #100 are the shades
plot(l2011, col=clb)

# Plotting one element
plot(l2011[[4]], col=clb)  
plot(l2011$B4_sre, col=clb) #We use the double brackets or the dollar sign to choose the item we want
nir <- l2011 [[4]]
plot(nir, col=clb)

# Exercise: change the colour gamut for all the images
clb <- colorRampPalette(c("blue", "darkorchid", "cyan3")) (100)
plot(l2011, col=clb)

# Plot the NIR band
# b1=blue
# b2=green
# b3=red
# b4=NIR

# Export graphs in R
pdf("myfirstgraph.pdf")
plot(l2011[[4]], col=clb)

dev.off() # It closes graphs

# Plotting several bands in a multiframe
# We can use the par() function in R to create multiple graphs at the same time. This helps us create an arrangement of figures with fine control
par(mfrow = c (2,1)) 

# Plotting the first 4 layers / bands
par(mfrow = c(2,2))

# B1 (blue)
clblue <- colorRampPalette(c("blue4", "aquamarine", "cyan3")) (100)
plot(l2011[[1]], col=clblue)

# B2 (green)
clgreen <- colorRampPalette(c("chartreuse4", "chartreuse2", "chartreuse")) (100)
plot(l2011[[2]], col=clgreen)

# B3 (red)
clred <- colorRampPalette(c("brown3", "brown2", "brown1")) (100)
plot(l2011[[3]], col=clred)

# B4 (NIR)
clNIR <- colorRampPalette(c("darkorchid4", "chocolate4", "darkorange")) (100)
plot(l2011[[4]], col=clNIR)

# RGB plotting
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")

# Multiframe with natural and false colours
# We can use stretch to lengthen the color band 
# Linear stretch doesn't change the colors of our image
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")

# Histogram stretching: It allows us to highlight the difference,
# between minimums and maximums in a more accentuated way
par(mfrow = c(2,1))
plotRGB(l2011, 4, 3, 2, stretch="Hist")

# Excersise: import the 1988 image and do the same procedure for this other image
l1988 <- brick("p224r63_1988_masked.grd")
l1988
plot(l1988)

plotRGB(l1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")

# Create a multiframe
par(mfrow = c(2,1))
plotRGB(l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")

# Exercise, make a multiframe with 2 rows and 2 columns, 1988 lin, 2011 lin, 1988 hist, 2011 hist
# Then create an RGB plot with infrared in red
par(mfrow = c(2,2))
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

