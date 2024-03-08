using GeoIO
using CSV

## load data from IBGE and other sources

address = CSV.File("data/raw/3303401.csv")

address = GeoIO.load("data/raw/ibge/domicilios.csv", coords = ("LONGITUDE", "LATITUDE"))
rivers = GeoIO.load("data/raw/friburgo/hidrografia_25k_limite_oficial.shp")
slides = GeoIO.load("data/raw/friburgo/Corrida_de_Massa_A.shp")
fschool = GeoIO.load("data/raw/friburgo/Educacao_federal.shp")
sschool = GeoIO.load("data/raw/friburgo/Escolas_estaduais.shp")
mschool = GeoIO.load("data/raw/friburgo/Escolas_municipais.shp")
pschool = GeoIO.load("data/raw/friburgo/Escolas_particulares.shp")
pharmacy = GeoIO.load("data/raw/friburgo/Farmacias.shp")
floods = GeoIO.load("data/raw/friburgo/Inundacao_A.shp")
health = GeoIO.load("data/raw/friburgo/Saude.shp")

## addresses in Nova Friburgo

# see https://www.ibge.gov.br/explica/codigos-dos-municipios.php
infriburgo = findall(==(3303401), address.COD_MUN)

address = address[infriburgo, :]

## save relevant data for plotly/dash app

GeoIO.save("data/clean/address.csv", address, coords = ("LONGITUDE", "LATITUDE"))
