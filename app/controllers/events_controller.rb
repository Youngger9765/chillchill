class EventsController < ApplicationController

  before_action :find_event, :only => [:show, :update, :destroy, :registration_form]

  def index
    @events = Event.all
    @project = Project.find(params[:project_id] )

    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.new
    end
  end

  def show
    @registration_form = RegistrationForm.new
  end

  def registration_form
    @registration_form = RegistrationForm.new(registration_form_params)
    @registration_form.event_id = @event.id
    
    if current_user
      @registration_form.user_id = current_user.id
    end

    if @registration_form.save
      flash[:notice] = "Create Success!"

      if @event.questions.size > 0
        @event.questions.each do |question|
          if question.answer_type == "客戶填寫"
            ans = params["question-#{question.id}"]
            create_customer_ans(question,ans)

          elsif question.answer_type == "單選"
            ans = params["question-#{question.id}"]
            create_customer_ans(question,ans)
          
          elsif question.answer_type == "多選"
            num = question.id.to_s.length
            ans =[]
            params.keys.each do |key|
              if key[0,9] == "question-" && key[9,num] == "#{question.id}"
                ans << params[key]
              end              
            end  
            create_customer_ans(question,ans)
          end
        end 
      end

      redirect_to project_event_path(:project_id => params[:project_id],:id => @event.id)
    else
      flash[:alert] = "Create fail!"
      render "show"
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def registration_form_params
    params.require(:registration_form).permit( :event_id, :first_name,:last_name,
                                               :phone_number, :email, :people, :kids,
                                               :registed_day, :payment, :notice, :opinion,
                                               :user_id
                                              )
  end

  def create_customer_ans(question,ans)
    customer_answer = question.customer_answers.new(:registration_form_id => @registration_form.id)
    customer_answer.content = ans
    customer_answer.save
  end


end
