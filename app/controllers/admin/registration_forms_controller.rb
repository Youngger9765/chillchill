class Admin::RegistrationFormsController < ApplicationController

  layout "admin" 

  before_action :find_event, :only =>[:index]

  def index
    @registrstion_forms = @event.registration_forms
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

end
