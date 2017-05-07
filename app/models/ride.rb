class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets? && tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif enough_tickets? && tall_enough?
      "Thanks for riding the #{attraction.name}"
      self.user.update(:tickets => self.user.tickets - self.attraction.tickets)
      self.user.update(:nausea => self.user.nausea + self.attraction.nausea_rating)
      self.user.update(:happiness => self.user.happiness + self.attraction.happiness_rating)
    end
  end


    def enough_tickets?
      # binding.pry
      self.user.tickets >= self.attraction.tickets
    end

    def tall_enough?
      self.user.height >= self.attraction.min_height
    end
end
