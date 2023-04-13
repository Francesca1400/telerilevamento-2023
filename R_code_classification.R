#Classification of remote sensing data via RStoolbox

#Installing devtools
# install.packages("RStoolbox")
# library(RStoolbox)

# setwd
("C:/lab/") 

# data import
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#plotting
plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")
