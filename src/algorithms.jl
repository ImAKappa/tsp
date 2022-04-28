"""
Test algorithms/heuristics with n cities
"""
function test_n_cities(city_df, n, algorithm; debug=true)
  city_n = get_cities(first(city_df, n))
  results = Vector{NamedTuple}(undef, length(algorithms))
  name = Symbol(algorithm)
  best_city_order = algorithm(city_n)
  best_distance = calc_distance(best_city_order)
  results[i] = (; name, best_city_order, best_distance)
  if debug
    @show name
    @show best_city_order
    @show best_distance
  end
  return results
end

function profile_n_cities(city_df::DataFrame, n::Integer, algorithm::Function)
  city_n = get_cities(first(city_df, n))
  b = @benchmark $algorithm(cities) setup=(cities=$city_n)
  return b
end

function profile_n_cities(city_df::DataFrame, ns::UnitRange{T}, algorithm::Function) where {T<:Integer}
  return [profile_n_cities(city_df, n, algorithm) for n in ns]
end

### ALGORITHMS ###

function try_all_permutations(cities::AbstractVector) where {T<:City}
  best_order = cities
  best_distance = calc_distance(best_order)
  # Iterate through all city-order permutations
  for city_order in permutations(cities)
    distance = calc_distance(city_order)
    if distance < best_distance
      best_order = city_order
      best_distance = distance
    end
  end
  return best_order
end