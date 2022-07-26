require_relative "../rentals/rental_price"
require_relative "../rentals/commission"

class JsonOutput < RentalPrice
  def json_output(include_discount: false, include_commission: false)
    res = []

    rentals.each do |rental|

        # hash containing id and price
        id_and_price_hash = 
          {
            "id": rental["id"],
            "price": total_rental_price(rental, include_discount),
          }
        
        #include commission in id_and_price_hash when neccessary 
        if include_commission
          commission = Commission.new(total_rental_price(rental, include_discount), dates_to_days(rental["start_date"], rental["end_date"]))
          commission_hash = 
            { "commission": 
              {
                "insurance_fee": commission.insurance,
                "assistance_fee": commission.roadside_assistance,
                "drivy_fee": commission.getaround
              }
            } 
          id_and_price_hash.merge!(commission_hash)
        end


        
          
        res << id_and_price_hash
        
    end

    {rentals: res}.to_json
  end
end 
