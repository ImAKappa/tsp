function display_cities(cities::AbstractVector{T}) where {T<:City}
  lats = [city.c.lat for city in cities]
  longs = [city.c.long for city in cities]

  fig = Figure()
  ax = Axis(fig[1, 1])
  scatter!(ax, longs, lats, markersize=4)
  ax.title = "World Cities (Projected) Map"
  ax.xlabel = "Longitutde"
  ax.ylabel = "Latitude"
  return fig
end

function display_time_complexity(city_df::DataFrame, ns::UnitRange{T}, algorithm::Function) where {T<:Integer}
  bmarks = profile_n_cities(city_df, ns, algorithm)
  min_times = [minimum(b).time for b in bmarks]

  fig = Figure()
  ax = Axis(fig[1, 1])
  lines!(ax, collect(ns), min_times)
  ax.title = "Complexity of $(Symbol(algorithm))"
  ax.xlabel = "Number of Cities"
  ax.ylabel = "Time (ns)"
  return fig
end