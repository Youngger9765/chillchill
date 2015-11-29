class Admin::EventsController < ApplicationController

  layout "admin"

  before_action :find_event, :only => [:update, :destroy]

  def index
    @events = Event.all

    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.new
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Create Success!"
      redirect_to admin_events_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end
  end

  def update
    @event.update(event_params)
    
    if params[:destroy_logo] == "1"
        @event.logo = nil
        @event.save
    end

    flash[:notice] = "Update Success!"
    redirect_to admin_events_path
  end

  def destroy
    @event.destroy

    redirect_to admin_events_path
  end



  private

  def event_params
    params.require(:event).permit(:project_id, :note, :name, :en_name,
                                  :start_date, :end_date, :start_time, :end_time,
                                  :place,:address, :cost, :notice, :logo
                                  )
  end   

  def find_event
    @event = Event.find(params[:id])
  end

end
