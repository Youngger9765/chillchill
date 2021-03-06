class Admin::InformationsController < ApplicationController

  layout "admin"
  
  def index
    @partner = Partner.find(params[:partner_id])
    @information = Information.new
    @informations = @partner.informations
  end

  def create
    @information = Information.create(information_params)
    @information.update(:partner_id => params[:partner_id])

    if @information.save
      flash[:notice] = "Create Success!"
      redirect_to admin_informations_path(:partner_id => params[:partner_id])
    else
      flash[:alert] = "Create fail!"
      render "index"
    end
  end

  private

  def information_params
    params.require(:information).permit(:address, :en_address, :company, :en_company,
                                    :open_day, :en_open_day, :open_time, :close_time
                                    )
  end

end
