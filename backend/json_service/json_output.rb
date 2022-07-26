require "../rental_price"

class JsonOutput < RentalPrice
  def json_output(include_discount: false)
    res = []

    rentals.each do |rental|
      res << 
        {
          "id": rental["id"],
          "price": total_rental_price(rental, include_discount)
        }
    end

    {rentals: res}.to_json
  end
end 