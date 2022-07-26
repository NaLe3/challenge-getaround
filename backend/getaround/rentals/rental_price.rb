require_relative "../json_service/json_input"
require "pry"

class RentalPrice < JsonInput

  def total_rental_price(rental, include_discount)
    if include_discount
      nb_days = rental.dates_to_days
      price_per_day = get_car(rental.car_id)["price_per_day"]
      case nb_days
      when 0..1  then res = total_days_price(rental)
      when 2..4  then res = total_price_with_10_pcrt_discount(nb_days, price_per_day)
      when 5..10 then res = total_price_with_10_30_pcrt_discount(nb_days, price_per_day)
      else 
        res = total_price_with_10_30_50_pcrt_discount(nb_days, price_per_day)
      end
    else
      res = total_days_price(rental)
    end
    res.to_i + total_km_price(rental)
  end 

  def total_price_with_10_pcrt_discount(nb_days, price_per_day)
    price_per_day + (nb_days - 1) * price_per_day * 0.9 
  end

  def total_price_with_10_30_pcrt_discount(nb_days, price_per_day)
    price_per_day + (4 - 1) * price_per_day * 0.9 + (nb_days - 4) * price_per_day * 0.7
  end 

  def total_price_with_10_30_50_pcrt_discount(nb_days, price_per_day)
    price_per_day + (4 - 1) * price_per_day * 0.9 + (10 - 4) * price_per_day * 0.7 + (nb_days - 10) * price_per_day * 0.5
  end

  def total_days_price(rental)
    rental.dates_to_days * get_car(rental.car_id)["price_per_day"]
  end

  def total_km_price(rental)
    (rental.distance *  get_car(rental.car_id)["price_per_km"]).to_i
  end

end