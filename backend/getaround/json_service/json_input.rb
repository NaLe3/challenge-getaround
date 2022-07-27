require "json"
require "pry"

class JsonInput

  def initialize(json_input)
    @json_input = JSON.parse(File.read(json_input))
  end

  def cars
    @json_input["cars"]
  end

  def get_car(id)
    cars.find{ |car| car["id"] == id }
  end

  def rentals
    @json_input["rentals"]
  end

  def options
    @json_input["options"]
  end 

  def select_option_with_rental_id(rental_id)
    return [] if options.nil?
    options.select { |option| option["rental_id"] == rental_id }
  end


end