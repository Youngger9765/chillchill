class PartnersController < ApplicationController

  before_action :find_partner, :only =>[:show, :update]

  def index
    @partners = Partner.all
    @partner = Partner.new
  end

  def create
    @partners = Partner.all
    @partner = Partner.new(partner_params)
    
    if @partner.save
      flash[:notice] = "Create Success!"
      redirect_to partners_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end

  end

  def show
  end

  def update
    @partner.update(partner_params)
    flash[:notice] = "Update Success!"
    redirect_to partner_path(@partner)
  end


  private

  def partner_params
    params.require(:partner).permit(:name, :company, :introduction, :my_chillchill,
                                    :en_name, :en_company, :en_introduction, :en_my_chillchill
                                    )
  end

  def find_partner
    @partner = Partner.find(params[:id])
  end

end
