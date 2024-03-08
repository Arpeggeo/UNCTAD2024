using CSV
using PlotlyJS
using Statistics

## load IBGE data

data = CSV.File("data/3303401.csv")

## density map of coordinates

lon = data.LONGITUDE
lat = data.LATITUDE

dens = densitymapbox(lon = lon, lat = lat, radius = 4)

## visualization settings

layout = Layout(
  mapbox_style = "open-street-map",
  mapbox_center_lon = median(lon),
  mapbox_center_lat = median(lat),
  mapbox_zoom = 10
)

## display figure

fig = plot(dens, layout)
