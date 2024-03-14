using CSV
using PlotlyJS
using Statistics

## load IBGE Censo 2022 coordinates

# coordinates for Nova Friburgo
data = CSV.File("data/3303401.csv")

# map codes to types of address
dict = Dict(
  1 => "Domicílio particular",
  2 => "Domicílio coletivo",
  3 => "Estabelecimento agropecuário",
  4 => "Estabelecimento de ensino",
  5 => "Estabelecimento de saúde",
  6 => "Estabelecimento de outras finalidades",
  7 => "Edificação em construção",
  8 => "Estabelecimento religioso"
)

## density map of coordinates

lon = data.LONGITUDE
lat = data.LATITUDE
key = [dict[k] for k in data.COD_ESPECIE]

dens = densitymapbox(lat = lat, lon = lon, customdata = key,
                     radius = 4, colorscale = "YlOrRd",
                     hovertemplate = """
                     <b>%{customdata}</b><br>
                     latitude: %{lat}<br>
                     longitude: %{lon}
                     <extra></extra>
                     """)

## visualization settings

layout = Layout(
  height = "800",
  #mapbox_style = "mapbox://styles/mapbox/satellite-streets-v12",
  #mapbox_style = "mapbox://styles/mapbox/streets-v12",
  mapbox_style = "mapbox://styles/mapbox/navigation-night-v1",
  mapbox_accesstoken = ENV["MAPBOX_TOKEN"],
  mapbox_center_lon = median(lon),
  mapbox_center_lat = median(lat),
  mapbox_zoom = 10
)

## display figure

fig = plot(dens, layout)
