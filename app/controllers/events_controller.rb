class EventsController < ApplicationController

  before_action :find_event, :only => [:update, :destroy]

  def index
    @events = Event.all

    if params[:event_id]
      @event = Event.find(params[:event_id])
    else
      @event = Event.new
    end
  end


  private

  def find_event
    @event = Event.find(params[:id])
  end


end
