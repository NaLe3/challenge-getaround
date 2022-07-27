require_relative "../json_service/json_input"
require_relative "./discount"
require_relative "./car"
require "pry"

class RentalPrice < JsonInput
  

  def total_rental_price(rental, include_discount)

    car = Car.new(get_car(rental.car_id))

    res = total_km_price(car, rental)

    if include_discount
      res += Discount.new(car, rental, rental.duration_in_days).amount
    else
      res += total_days_price(car, rental) 
    end 

  end 

  private

  def total_days_price(car, rental)
    rental.duration_in_days * car.price_per_day
  end

  def total_km_price(car, rental)
    (rental.distance *  car.price_per_km).to_i
  end

end