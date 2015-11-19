class PartnersController < ApplicationController

  def index
    @partners = Partner.all
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(find_partner)

    if @partner.save
      flash[:notice] = "Create Success!"
      redirect_to partners_path
    end
    
  end


  private

  def find_partner
    params.require(:partner).permit(:name, :company)
  end

end
