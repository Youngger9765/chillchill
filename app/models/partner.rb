class Partner < ActiveRecord::Base

  validates_presence_of :name, :company

  has_many :partner_information_ships
  has_many :informations, :through => :partner_information_ships

end
