class PartnerInformationShip < ActiveRecord::Base

  belongs_to :partner
  belongs_to :information
  
end
