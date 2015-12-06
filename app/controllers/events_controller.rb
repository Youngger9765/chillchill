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

    if @registration_form.save
      flash[:notice] = "Create Success!"
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
                                               :registed_day, :payment, :notice, :opinion
                                              )
  end


end
