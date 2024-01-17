# Classification for land cover

# Install packages and recall with library ggplot2 for graphs
install.packages(ggplot2)
library(ggplot2)  
library(raster)

# Set working directory
setwd("C:/lab/")

# Import the necessary files
defor1 <- brick("defor1_.png")
defor2 <- brick("defor2_.png")

# Plotting RGB
# NIR 1 , RED2 , GREEN 3
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Classification defor1
# Get all the single values
singlenr1 <- getValues(defor1)
singlenr1

# Classify with kmeans
kcluster1 <- kmeans(singlenr1, centers = 2)
kcluster1

# Recreating an image
defor1class <- setValues(defor1[[1]], kcluster1$cluster)

# Plotting
plot(defor1class)

# Class1: forest
# Class2: bare soil

# Classification defor2

# 1 step: Get all the single values
singlenr2 <- getValues(defor2)
singlenr2

# 2 step: Classify
kcluster2 <- kmeans(singlenr2, centers = 2)
kcluster2

# 3 step: Set the values to a raster
defor2class <- setValues(defor2 [[1]], kcluster2$cluster)

# Plotting
plot(defor2class)

# Class1: forest
# Class2 : agricolture

# For multiframes with ggplot2 use patchwork and then recall it with the library
install.packages("patchwork")
library(patchwork)

# Now let's calculate the frequency and the percentage

frequencies1 <- freq(defor1class)
tot1 = ncell(defor1class)
tot1   # Tot 1 =341292
percentages1 = frequencies1 * 100 /  tot1
percentages1  

# Class1 = 89.74632%  
# Class2 = 10.25368%

# Class percentages defor2
frequencies2 <- freq(defor2class)
tot2 = ncell(defor2class)
tot2  # Tot 2 = 342726
percentages2 = frequencies2 * 100 /  tot2
percentages2  

# Class1 = 47.931  
# Class2 = 52.069

# Build a dataframe
cover <- c("Forest", "Bare soil ")
percent1992 <- c(89.74, 10.25)
percent2006 <- c(47.93, 52,09)

# Creating dataframe
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

# Plotting with ggplot2
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white") # 1992
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white") # 2006

# I use the patchwork features to merge my two graphs into one image
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
p1+p2

# Put the same percentages limits
# Use ylim function, ìthis function is used to set the lower and upper limit on the y-axis and x-axis respectively.
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1+p2










