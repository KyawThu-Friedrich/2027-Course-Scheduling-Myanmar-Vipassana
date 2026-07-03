#install.packages("ggrepel")

# Load required libraries
library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggrepel)



# Coordinates of the centres (latitude, longitude)
centres<- read.csv('MMMcenters2027.csv') # MyanmarCentresLatLong_1 



# Load Myanmar map
myanmar_map <- ne_countries(scale = "medium", returnclass = "sf") %>%
  dplyr::filter(admin == "Myanmar")

# Plot the map
ggplot(data = myanmar_map) +
  geom_sf(fill = "lightgray", color = "black") +  # Plot Myanmar map
  geom_point(data = centres, aes(x = Longitude, y = Latitude), 
             color = "red", size = 3) +  # Add city points
  geom_text_repel(data = centres, aes(x = Longitude, y = Latitude, label = Centre), 
                  color = "blue", size = 4, max.overlaps = 15) +  # Adjust labels
  labs(title = "Vipassana Centres in Myanmar",subtitle="Year 2027")#, subtitle = " Vipassana Centers in Myanmar") +  # Add title
  theme_minimal()
  