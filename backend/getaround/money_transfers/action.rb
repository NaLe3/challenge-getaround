
require_relative "../rentals/option"
require "pry"

class MoneyAction

  def initialize(rental, rental_price, commission, options_hash)
    @rental = rental
    @rental_price = rental_price
    @commission = commission
    @options = Option.new(rental, options_hash)
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
      "amount": @rental_price + @options.amount_for_owner + @options.amount_for_getaround
    }
  end

  def owner
    {
      "who": "owner",
      "type": "credit",
      "amount": @rental_price - @commission.overall_rental + @options.amount_for_owner
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
      "amount": @commission.getaround + @options.amount_for_getaround
    }
  end

end 