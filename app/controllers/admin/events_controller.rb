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

    if params[:event][:day_list]
      @event.reservation_days.delete_all
      day_list = params[:event][:day_list]
      day_list.shift(1)

      day_list.each do|d|
        if ReservationDay.find_by_day_info(d) == nil
          day = ReservationDay.create!(:day_info => d)
          EventReservationDayShip.create!( :event_id => @event.id, :reservation_day_id => day.id)
        elsif @event.reservation_days.find_by_day_info(d)

        else
          day =ReservationDay.find_by_day_info(d)
          EventReservationDayShip.create!( :event_id => @event.id, :reservation_day_id => day.id)
        end
      end
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
    params.require(:event).permit(:project_id, :introduction,:en_introduction,
                                  :name, :en_name, :content, :en_content,
                                  :date, :time,
                                  :place,:address, :cost, :discount,
                                  :notice,:tips, :logo , :day_list
                                  )
  end   

  def find_event
    @event = Event.find(params[:id])
  end

end
