require_relative "./rental_price"
require "pry"

class Commission 

  COMMISSIONS = {
    "overall": 0.3,  # commission to apply on the rental price
    "insurance": 0.5, # percentage of the overall commission 
    "roadside_assistance": 100, # price in cent per day of rental 
  }

  def initialize(rental_price, rental_duration)
    @rental_price = rental_price
    @rental_duration = rental_duration
  end

  def overall_rental
    (COMMISSIONS[:overall] * @rental_price).to_i
  end

  def insurance
    (overall_rental * COMMISSIONS[:insurance]).to_i
  end

  def roadside_assistance
    (COMMISSIONS[:roadside_assistance] * @rental_duration).to_i
  end

  def getaround
    overall_rental - insurance - roadside_assistance
  end

  def hash_output
    {
      "commission": 
      {
        "insurance_fee": insurance,
        "assistance_fee": roadside_assistance,
        "drivy_fee": getaround
      }
    }
  end 

end 