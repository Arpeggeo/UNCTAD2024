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

## visualization settings

## display figure
