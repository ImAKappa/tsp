using CSV, DataFrames
using Combinatorics
using BenchmarkTools

using CairoMakie
CairoMakie.activate!(type = "png")
set_theme!(theme_ggplot2())

include("$(pwd())/src/coordinates.jl")
include("$(pwd())/src/cities.jl")
include("$(pwd())/src/algorithms.jl")
include("$(pwd())/src/visualization.jl")

# Load city data
city_csv_path = "$(pwd())/data/cities/simplemaps_worldcities_basicv1.75/worldcities.csv"
city_df = get_df(city_csv_path)
all_cities = get_cities(city_df)

# Visualize cities
all_cities_plot = display_cities(all_cities)
save("$(pwd())/plots/all_cities_plot.png", all_cities_plot)

n = 8
test_n_cities(city_df, n, try_all_permutations)
profile_n_cities(city_df, n, try_all_permutations)

display_time_complexity(city_df, 2:10, try_all_permutations)