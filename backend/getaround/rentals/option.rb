require "pry"

class Option

  OPTIONS = {
    "gps": 500,
    "baby_seat": 200,
    "additional_insurance": 1000
  } 

  def initialize(rental, option_hash)
    @option_hash = option_hash
    @rental = rental
  end

  def amount_for_owner
    options_price = 0
    select_option_with_rental_id(@rental.id)&.each do |option|
      case option["type"]
      when "gps"
        options_price += @rental.duration_in_days * OPTIONS[:gps]
      when "baby_seat"
        options_price += @rental.duration_in_days * OPTIONS[:baby_seat]
      end
    end
    options_price 
  end

  def amount_for_getaround
    options_price = 0
    select_option_with_rental_id(@rental.id)&.each do |option|
      case option["type"]
      when "additional_insurance"
        options_price += @rental.duration_in_days * OPTIONS[:additional_insurance]
      end
    end
    options_price 
  end

  def select_option_with_rental_id(rental_id)
    return [] if @option_hash.nil?
    @option_hash.select { |option| option["rental_id"] == rental_id }
  end

end 