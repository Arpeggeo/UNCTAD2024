using CSV
using PlotlyJS
using Statistics

## load relevant data

address = CSV.File("data/3303401.csv")

## global map settings

lon = address.LONGITUDE
lat = address.LATITUDE

layout = Layout(
  mapbox_style = "open-street-map",
  mapbox_center_lon = median(lon),
  mapbox_center_lat = median(lat),
  mapbox_zoom = 10
)

## density map of addresses

dens = densitymapbox(lon = lon, lat = lat, radius = 4)

## display visualization

plot(dens, layout)
