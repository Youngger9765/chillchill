class PreAnswer < ActiveRecord::Base

  has_many  :question_pre_answer_ships
  has_many  :questions, :through => :question_pre_answer_ships
end
