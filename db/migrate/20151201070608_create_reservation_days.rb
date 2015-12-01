class CreateReservationDays < ActiveRecord::Migration
  def change
    create_table :reservation_days do |t|
      t.string    :day_info
      t.timestamps null: false
    end
  end
end
