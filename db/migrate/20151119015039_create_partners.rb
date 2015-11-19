class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :company
      t.text :intrduction
      t.text :my_chillchill
      t.timestamps null: false
    end
  end
end
