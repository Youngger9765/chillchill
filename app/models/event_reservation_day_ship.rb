class EventReservationDayShip < ActiveRecord::Base

  belongs_to :event
  belongs_to :reservation_day

end
