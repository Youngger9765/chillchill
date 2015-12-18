class Admin::QuestionsController < ApplicationController

  layout "admin"  

  before_action :find_event, :only => [:index, :create]
  
  def index
    @questions = @event.questions.all

    if params[:question_id]
      @question = Question.find(params[:question_id])
    else
      @question = Question.new
    end

  end

  def create
    @question = @event.questions.new(question_params)

    if @question.save

      if question_params[:answer_type]=="客戶填寫"
        params[:question][:pre_answer]=[]
      end

      if params[:question][:pre_answer].size >1
        params[:question][:pre_answer].shift(1)
        pre_answers = params[:question][:pre_answer]
        pre_answers.each do |pre_answer|

          if PreAnswer.find_by_a_content(pre_answer) 
            pa = PreAnswer.find_by_a_content(pre_answer)
            QuestionPreAnswerShip.create!( :question_id => @question.id, :pre_answer_id => pa.id)
           
          else
            pa = PreAnswer.create!(:a_content => pre_answer)
            QuestionPreAnswerShip.create!( :question_id => @question.id, :pre_answer_id => pa.id)
          
          end
        end 
      end


      flash[:notice] = "Create Success!"
      redirect_to admin_event_questions_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end

  end

private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def question_params
    params.require(:question).permit(:content, :answer_type, :q_category)
  end

end
