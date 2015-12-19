class CreateQuestionPreAnswerShips < ActiveRecord::Migration
  def change
    create_table :question_pre_answer_ships do |t|
      t.integer   :question_id
      t.integer   :pre_answer_id
      t.timestamps null: false
    end
  end
end
