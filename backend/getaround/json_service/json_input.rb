require "json"
require "pry"

class JsonInput

  def initialize(json_input)
    @json_input = JSON.parse(File.read(json_input))
  end

  def cars
    @json_input["cars"]
  end

  def json_rentals
    @json_input["rentals"]
  end

  def get_car(id)
    cars.find{ |car| car['id'] == id }
  end

end