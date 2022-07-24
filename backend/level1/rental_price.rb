require "./json_service"
require "date"
require "pry"

class RentalPrice < JsonService

  def json_output
    res = []

    rentals.each do |rental|
      res << 
        {
          "id": rental["id"],
          "price": total_rental_price(rental)
        }
    end

    {rentals: res}.to_json
  end

  def dates_to_days(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)

    (end_date - start_date).to_i + 1
  end 

  def total_rental_price(rental)
    total_days_price(rental) + total_km_price(rental)
  end 

  def total_days_price(rental)
    dates_to_days(rental["start_date"], rental["end_date"]) * get_car(rental["car_id"])["price_per_day"]
  end

  def total_km_price(rental)
    rental["distance"] *  get_car(rental["car_id"])["price_per_km"]
  end 

end