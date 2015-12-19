class QuestionPreAnswerShip < ActiveRecord::Base

  belongs_to :question
  belongs_to :pre_answer

end
