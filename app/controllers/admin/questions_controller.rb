class Admin::QuestionsController < ApplicationController

  layout "admin"  

  #後台登入
  before_action :authenticate_user!

  #檢查權限
  before_action :check_admin

  before_action :find_event, :only => [:index, :create]
  before_action :find_question, :only => [:destroy, :update]
  
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

      update_pre_answers

      flash[:notice] = "Create Success!"
      redirect_to admin_event_questions_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_event_questions_path   
  end 

  def update
    @question.update(question_params)

    update_pre_answers

    redirect_to admin_event_questions_path 
  end

private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :answer_type, :q_category)
  end

  def update_pre_answers
    @question.pre_answers.delete_all

    if question_params[:answer_type]=="客戶填寫"
      params[:question][:pre_answer]=[]
    end

    if params[:question][:pre_answer].size >1
      params[:question][:pre_answer].shift(1)
      pre_answers = params[:question][:pre_answer]
      pre_answers.each do |pre_answer|

        if PreAnswer.find_by(:a_content => pre_answer) 
          pa = PreAnswer.find_by_a_content(pre_answer)
          QuestionPreAnswerShip.create!( :question_id => @question.id, :pre_answer_id => pa.id)
         
        else
          pa = PreAnswer.create!(:a_content => pre_answer)
          QuestionPreAnswerShip.create!( :question_id => @question.id, :pre_answer_id => pa.id)
        
        end
      end 
    end
  end

  def check_admin
    unless current_user.admin?
        raise ActiveRecord::RecordNotFound
    end
  end

end
