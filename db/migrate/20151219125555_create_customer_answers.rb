class CreateCustomerAnswers < ActiveRecord::Migration
  def change
    create_table :customer_answers do |t|
      t.integer :registration_form_id,:index => true 
      t.integer :question_id,:index => true 
      t.text    :content
      t.timestamps null: false
    end
  end
end
