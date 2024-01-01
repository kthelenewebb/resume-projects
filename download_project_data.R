### Load libraries 
library(readr)
library(sf)
library(tigris)

# Download County Health Ranking data
download.file("https://www.countyhealthrankings.org/sites/default/files/media/document/analytic_data2023_0.csv",
              destfile = "../raw_data/analytic_data2023_0.csv")

# Read in County Health Ranking data
CHR <- read_csv("../raw_data/analytic_data2023_0.csv")

# Read in spatial data/ cartographic boundaries
cnty_cb_sf <- counties(state = "NC",
                           cb = TRUE,
                           resolution = "500k")

# Write in to directory
cnty_cb_sf |> write_sf("../raw_data/State_Owned_Lands_NC_Latest.gpkg")
