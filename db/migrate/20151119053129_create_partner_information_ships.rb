class CreatePartnerInformationShips < ActiveRecord::Migration
  def change
    create_table :partner_information_ships do |t|
      t.integer :partner_id
      t.integer :information_id
      t.timestamps null: false
    end
  end
end
