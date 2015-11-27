class Admin::PartnersController < ApplicationController

  layout "admin"

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
      redirect_to admin_partners_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end

  end

  def show
    @informations = @partner.informations
    @fb_url = @partner.urls.find_by(:category => "fb").try(:url)
    @blog_url = @partner.urls.find_by(:category => "blog").try(:url)
    @web_url = @partner.urls.find_by(:category => "web").try(:url)
  end

  def update
    @partner.update(partner_params)
    flash[:notice] = "Update Success!"
    if params[:destroy_logo] == "1"
      @partner.logo = nil
      @partner.save
    end

    if partner_params[:fb_url]
      if(@partner.fb == nil)
        @url = Url.create(:url => partner_params[:fb_url], :category => "fb")
        PartnerUrlShip.create(:partner_id => @partner.id, :url_id => @url.id)
      else  
        @partner.fb.update(:url => partner_params[:fb_url])
      end
    end

    if partner_params[:blog_url]
      if(@partner.blog == nil)
        @url = Url.create(:url => partner_params[:blog_url], :category => "blog")
        PartnerUrlShip.create(:partner_id => @partner.id, :url_id => @url.id)
      else
        @partner.blog.update(:url => partner_params[:blog_url])
      end
    end

    if partner_params[:web_url]
      if(@partner.web == nil)
        @url = Url.create(:url => partner_params[:web_url], :category => "web")
        PartnerUrlShip.create(:partner_id => @partner.id, :url_id => @url.id)
      else
        @partner.web.update(:url => partner_params[:web_url])
      end
    end

    redirect_to admin_partner_path(@partner)
  end


  private

  def partner_params
    params.require(:partner).permit(:name, :company, :introduction, :my_chillchill,
                                    :en_name, :en_company, :en_introduction, :en_my_chillchill,
                                    :logo, :fb_url, :blog_url, :web_url
                                    )
  end

  def find_partner
    @partner = Partner.find(params[:id])
  end

end
