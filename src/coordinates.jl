"""

lat and long are in degrees
"""
struct Coordinate{T<:Real}
  lat::T
  long::T 
end

function deg2rad(deg::Real)
  return deg * (π/180)
end

function haversine(c1::Coordinate, c2::Coordinate)
  R = 6371 # Radius of earth in km
  Δlat = deg2rad(c2.lat - c1.lat)
  Δlong = deg2rad(c2.long - c1.long)
  a = sin(Δlat/2) * sin(Δlat/2) + cos(deg2rad(c1.lat)) * cos(deg2rad(c2.lat)) * sin(Δlong/2) * sin(Δlong/2)
  c = 2 * atan(sqrt(a), sqrt(1 - a))
  d = R * c
  return d
end