class Car
  def initialize(car_hash)
    @car = car_hash
  end

  def price_per_day
    @car["price_per_day"]
  end

  def price_per_km
    @car["price_per_km"]
  end
end