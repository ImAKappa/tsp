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