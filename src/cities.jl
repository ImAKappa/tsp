# Load city data into dataframe

function get_df(csv_path::AbstractString)
  isfile(csv_path) || error("No existing path: $(csv_path)")
  endswith(csv_path, r".csv") || error("Not a csv file")
  return CSV.read(csv_path, DataFrame)
end

struct City{S<:AbstractString}
  name::S
  c::Coordinate
end

function get_cities(city_df::DataFrame)
  cities = Vector{City}(undef, size(city_df, 1))
  for (i, r) in enumerate(eachrow(city_df))
    coord = Coordinate(r[:lat], r[:lng])
    cities[i] = City(r[:city], coord)
  end
  return cities
end

function calc_distance(cities::AbstractVector{T}) where {T<:City}
  total_distance = 0
  for i=1:(length(cities)-1)
    total_distance += haversine(cities[i].c, cities[i+1].c)
  end
  return total_distance
end