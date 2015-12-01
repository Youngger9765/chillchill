class ReservationDay < ActiveRecord::Base

  has_many  :event_reservation_day_ships
  has_many  :events, :through => :event_reservation_day_ships

end
