class CreatePartnerUrlShips < ActiveRecord::Migration
  def change
    create_table :partner_url_ships do |t|
      t.integer :partner_id
      t.integer :url_id
      t.timestamps null: false
    end
  end
end
