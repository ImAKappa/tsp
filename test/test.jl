function test_distance_accuracy()
  # Based on data computed from https://www.distancecalculator.net/

  # Tokyo to Jakarta = 5786.85 km
  # Jakarta to Delhi = 5003.53 km
  # Delhi to Manila = 4754.85 km
  # Manil to São Paulo = 18376.99 km
  distancecalculator = sum((5786.85, 5003.53, 4754.85, 18376.99))
  return distancecalculator
end