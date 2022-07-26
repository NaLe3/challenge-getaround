require_relative "../rentals/rental_price"
require "pry"

class MoneyAction

  def initialize(rental_price, commission)
    @rental_price = rental_price
    @commission = commission
  end

  def hash_output
    res = []

    res << driver << owner << insurance << assistance << getaround
  end

  private
  
  def driver
    {
      "who": "driver",
      "type": "debit",
      "amount": @rental_price
    }
  end

  def owner
    {
      "who": "owner",
      "type": "credit",
      "amount": @rental_price - @commission.overall_rental
    }
  end

  def insurance
    {
      "who": "insurance",
      "type": "credit",
      "amount": @commission.insurance
    }
  end

  def assistance
    {
      "who": "assistance",
      "type": "credit",
      "amount": @commission.roadside_assistance
    }
  end

  def getaround
    {
      "who": "drivy",
      "type": "credit",
      "amount": @commission.getaround
    }
  end
   
end 