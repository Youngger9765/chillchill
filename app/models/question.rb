class Question < ActiveRecord::Base
  
  validates_presence_of :content

  belongs_to :event

  has_many  :question_pre_answer_ships
  has_many  :pre_answers, :through => :question_pre_answer_ships

  def pre_answer
    self.pre_answers.map{ |d| d.a_content }
  end

  def pre_answer=(str)
    arr = str.split(",")

    self.pre_answers = arr.map do |d|
      pre_answer = PreAnswer.find_by_a_content(d)
      unless pre_answer
        pre_answer = PreAnswer.create!( :a_content => d )
      end
      pre_answer
    end
  end
end
