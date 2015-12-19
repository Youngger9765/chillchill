class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :event_id,:index => true 
      t.string :answer_type,:index => true 
      t.string :q_category,:index => true 
      t.text :content
      t.timestamps null: false
    end
  end
end
