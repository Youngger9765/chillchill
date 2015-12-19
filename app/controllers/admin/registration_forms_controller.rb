class Admin::RegistrationFormsController < ApplicationController

  layout "admin" 

  before_action :find_event, :only =>[:index, :update]

  before_action :find_registrstion_form, :only =>[:update]

  def index
    @registrstion_forms = @event.registration_forms
  end

  def update
   @registrstion_form.update(registrstion_form_params)

   flash[:notice] = "Update Success!" 
   redirect_to :back 
  end 

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_registrstion_form
    @registrstion_form = RegistrationForm.find(params[:id])
  end

  def registrstion_form_params
    params.require(:registration_form).permit(:payment_status)
  end

end
