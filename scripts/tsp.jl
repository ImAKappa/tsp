using CSV, DataFrames
using CairoMakie

CairoMakie.activate!(type = "png")
set_theme!(theme_ggplot2())

include("$(pwd())/src/coordinates.jl")
include("$(pwd())/src/cities.jl")
include("$(pwd())/src/visualization.jl")

city_csv_path = "$(pwd())/data/cities/simplemaps_worldcities_basicv1.75/worldcities.csv"

city_df = get_df(city_csv_path)
all_cities = get_cities(city_df)
all_cities_plot = display_cities(all_cities)

save("$(pwd())/plots/all_cities_plot.png", all_cities_plot)

city_df_5 = first(city_df, 5)

city_5 = get_cities(city_df_5)

calc_distance(city_5)