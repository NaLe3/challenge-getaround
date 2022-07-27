require_relative "../rentals/rental"
require_relative "../rentals/rental_price"
require_relative "../rentals/commission"
require_relative "../money_transfers/action"

class JsonOutput < RentalPrice 

  def json_output(hashes_to_pass = [], include_discount: false)
    res = []

      rentals.each do |rental|
        rental = Rental.new(rental)
        
        id_hash = {"id": rental.id}

        hashes_to_pass.each do |e|
          case e
          when :price
            id_hash.merge!(rental_price_hash(rental, include_discount))
          when :commission 
            id_hash.merge!(commission_hash(rental, include_discount))
          when :option 
            id_hash.merge!(option_hash(rental))
          when :action 
            id_hash.merge!(action_hash(rental, include_discount, options))
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
    commission = 
      Commission.new(
        total_rental_price(rental, include_discount), 
        rental.duration_in_days
      )
    commission.hash_output  
  end
  
  def action_hash(rental, include_discount, options)
    action = 
      MoneyAction.new(
        rental,
        total_rental_price(rental, include_discount), 
        Commission.new(
          total_rental_price(rental, include_discount), 
          rental.duration_in_days
        ),
        options
      )
    {actions: action.hash_output}
  end

  def option_hash(rental)
    options_type = []
    select_option_with_rental_id(rental.id)&.each do |option|
      options_type << option["type"]
    end
    {options: options_type}
  end

end 
