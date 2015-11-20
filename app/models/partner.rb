class Partner < ActiveRecord::Base

  validates_presence_of :name, :company

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_many :partner_information_ships
  has_many :informations, :through => :partner_information_ships

end
