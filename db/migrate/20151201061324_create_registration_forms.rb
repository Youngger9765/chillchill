class CreateRegistrationForms < ActiveRecord::Migration
  def change
    create_table :registration_forms do |t|
      t.integer  :event_id
      t.integer  :user_id
      t.string   :first_name
      t.string   :last_name
      t.integer  :phone_number
      t.string   :email
      t.integer  :people
      t.integer  :kids
      t.string   :registed_day 
      t.string   :payment
      t.string   :payment_status  
      t.text     :notice
      t.text     :opinion 
      t.timestamps null: false
    end
  end
end
