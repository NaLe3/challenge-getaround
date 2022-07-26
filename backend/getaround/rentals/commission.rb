require_relative "./rental_price"
require "pry"

class Commission 

  OVERALL_COMMISSION = 0.3  # commission to apply on the rental price
  INSURANCE_COMMISSION = 0.5 # percentage of the overall commission 
  ROADSIDE_ASSISTANCE_COMMISSION = 100 # price in cent per day of rental 

  def initialize(rental_price, rental_duration)
    @rental_price = rental_price
    @rental_duration = rental_duration
  end

  def overall_rental
    (OVERALL_COMMISSION * @rental_price).to_i
  end

  def insurance
    (overall_rental * INSURANCE_COMMISSION).to_i
  end

  def roadside_assistance
    (ROADSIDE_ASSISTANCE_COMMISSION * @rental_duration).to_i
  end

  def getaround
    overall_rental - insurance - roadside_assistance
  end

end 