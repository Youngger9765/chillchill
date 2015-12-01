class CreateEventReservationDayShips < ActiveRecord::Migration
  def change
    create_table :event_reservation_day_ships do |t|
      t.integer   :reservation_day_id
      t.integer   :event_id
      t.timestamps null: false
    end
  end
end
