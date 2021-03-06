class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :partner_id
      t.string :address
      t.string :en_address
      t.string :company
      t.string :en_company
      t.string :open_day
      t.string :en_open_day
      t.string :open_time
      t.string :close_time
      t.timestamps null: false
    end
  end
end
