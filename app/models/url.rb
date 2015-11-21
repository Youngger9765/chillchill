class Url < ActiveRecord::Base

  has_many :partner_url_ships
  has_many :partners, :through => :partner_url_ships

end
