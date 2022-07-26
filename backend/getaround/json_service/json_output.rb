require_relative "../rentals/rental"
require_relative "../rentals/rental_price"
require_relative "../rentals/commission"
require_relative "../money_transfers/action"

class JsonOutput < RentalPrice

  def json_output(rental_hashes_to_pass = [], include_discount: false, include_commission: false, include_action: false)
    res = []
    
      json_rentals.each do |json_rental|
        rental = Rental.new(json_rental)
        
        id_hash = {"id": rental.id}

        rental_hashes_to_pass.each do |e|
          case e
          when :price
            id_hash.merge!(rental_price_hash(rental, include_discount))
          when :commission 
            id_hash.merge!(commission_hash(rental, include_discount))
          when :action 
            id_hash.merge!(action_hash(rental, include_discount))
          end
        end
        
        res << id_hash
        
    end

    {rentals: res}.to_json
  end

  private 

  def rental_price_hash(rental, include_discount)
    {"price": total_rental_price(rental, include_discount)}
  end 

  def commission_hash(rental, include_discount)
    commission = Commission.new(total_rental_price(rental, include_discount), rental.dates_to_days)
    {
      "commission": 
      {
        "insurance_fee": commission.insurance,
        "assistance_fee": commission.roadside_assistance,
        "drivy_fee": commission.getaround
      }
    } 
  end
  
  def action_hash(rental, include_discount)
    action = MoneyAction.new(total_rental_price(rental, include_discount), Commission.new(total_rental_price(rental, include_discount), rental.dates_to_days))
    {actions: action.hash_output}
  end

end 
