class CreatePreAnswers < ActiveRecord::Migration
  def change
    create_table :pre_answers do |t|
      t.string :a_content
      t.timestamps null: false
    end
  end
end
