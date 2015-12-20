class Admin::RegistrationFormsController < ApplicationController

  layout "admin" 

  #後台登入
  before_action :authenticate_user!

  #檢查權限
  before_action :check_admin

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

  def check_admin
    unless current_user.admin?
        raise ActiveRecord::RecordNotFound
    end
  end

end
