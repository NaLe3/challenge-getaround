require "pry"

class Discount 

  DISCOUNTS = [
    { after_day: 10, discount: 0.5 },
    { after_day: 4,  discount: 0.3 },
    { after_day: 1,  discount: 0.1 },
    { after_day: 0,  discount: 0 }
  ]

  def initialize(car, rental, rental_duration)
    @car = car
    @rental = rental
    @rental_duration = rental_duration
  end

 
  def amount
    after_days = DISCOUNTS.map { |discount| discount[:after_day] }
    
    after_days.map do |nb_day|
      res = @rental_duration - nb_day
      res = 0 if res.negative?
      @rental_duration -= res
      res * @car.price_per_day * (1 - discount(nb_day))
    end.sum.to_i
  end 

  private

  def discount(nb_day)
    DISCOUNTS.detect { |discount| discount[:after_day] == nb_day }[:discount]
  end
end 