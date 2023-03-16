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

#Exercise: change the colour gamut for all the images
clb <- colorRampPalette(c("blue", "darkorchid", "cyan3")) (100)
plot(l2011, col=clb)

#plot the NIR band
# b1=blue
# b2=green
# b3=red
# b4=NIR

dev.off()
#it closes graphs

#export graphs in R
pdf("myfirstgraph.pdf")
plot(l2011[[4]], col=clb)
dev.off()

#Plotting several bands in a multiframe
par(mfrow = c (2,1))

#Plotting the first 4 layers /bands
par(mfrow = c(2,2))

#B1
clblue <- colorRampPalette(c("blue4", "aquamarine", "cyan3")) (100)
plot(l2011[[1]], col=clblue)

#B2
clgreen <- colorRampPalette(c("chartreuse4", "chartreuse2", "chartreuse")) (100)
plot(l2011[[2]], col=clgreen)

#B3
clred <- colorRampPalette(c("brown3", "brown2", "brown1")) (100)
plot(l2011[[3]], col=clred)

#B4
clNIR <- colorRampPalette(c("darkorchid4", "chocolate4", "darkorange")) (100)
plot(l2011[[4]], col=clNIR)

