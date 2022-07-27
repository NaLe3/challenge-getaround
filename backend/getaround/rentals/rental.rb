require "date"

class Rental

  def initialize(rental_hash)
    @rental_hash = rental_hash
  end

  def id
    @rental_hash["id"]
  end

  def car_id
    @rental_hash["car_id"]
  end

  def start_date
    Date.parse(@rental_hash["start_date"])
  end

  def end_date
    Date.parse(@rental_hash["end_date"])
  end

  def duration_in_days
    (end_date - start_date).to_i + 1
  end 

  def distance
    @rental_hash["distance"]
  end

end 