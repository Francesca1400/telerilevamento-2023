# Hi everyone! I'm Francesca and this is my exam project for the geoecological remote sensing course of professor D. Rocchini. 
# The project explains how the vegetation has changed due to the high temperatures of the summer months (June and July) 
# and the fires that occurred in August in the Belmonte area and in the areas close to the city of Palermo.

# Data from: https://scihub.copernicus.eu/

# First set the working directory
setwd("C:/Lab/") # For Windows

# We recall all the necessary packages
library(raster) # Lettura, scrittura, manipolazione, analisi e modellazione di dati spaziali.
library(ggplot2) # For graphs
library(patchwork) # To insert two different charts within the same chart

# Data may 7

# Importiamo ora le varie bande tenendo conto che: Importa le bande rosse (B04), 
# verde (B03), blu (B02) e nir (B08) e impilale in un unico oggetto

lst075 <- list.files(pattern="T33SUC_202305")
import075 <- lapply(lst075, raster)
i075 <- stack(import075)