class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :username
      t.string  :first_name
      t.string  :last_name 
      t.string  :birthday
      t.string  :location
      t.string  :locale
      t.string  :gender
      t.text    :education
      t.string  :status
      t.string  :fb_image
      t.timestamps null: false
    end

    add_index :profiles, :status
    add_index :profiles, :user_id
    add_index :profiles, :location
  end
end
