#My first code in GitHub
# Let's install the raster package
install.packages("raster")
library("raster")
setwd("C:/Lab/")
l2011 <-brick("p224r63_2011_masked.grd)
#plotting the data in a savage manner
plot(l2011)

colorRampPalette
clb <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011, col=clb)

#plotting one element
plot(l2011[[4]], col=clb)

plot(l2011$B4_sre, col=clb)

nir <-l2011 [[4]]
plot(nir, col=clb)

