using Dash

## setup dash app

app = dash()

app.layout = html_div() do
    html_h1("UNCTAD 2024"),
    html_div("Nova Friburgo density map"),
    dcc_graph(id = "density-map", figure = fig)
end

## run app on web browser

run_server(app)