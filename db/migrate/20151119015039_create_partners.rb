class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :en_name
      t.string :company
      t.string :en_company
      t.text :introduction
      t.text :en_introduction
      t.text :my_chillchill
      t.text :en_my_chillchill
      t.timestamps null: false
    end
  end
end
