require "json"
require "pry"

class JsonService

  def initialize(input_json)
    @input_json = JSON.parse(File.read(input_json))
  end

  def cars
    @input_json["cars"]
  end

  def rentals
    @input_json["rentals"]
  end

  def get_car(id)
    cars.find{ |car| car['id'] == id }
  end

end