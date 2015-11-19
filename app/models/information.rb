class Information < ActiveRecord::Base

  has_many :partner_information_ships
  has_many :partners, :through => :partner_information_ships

end
