class Project < ActiveRecord::Base

  validates_presence_of :name

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_many :category_project_ships
  has_many :categories, :through => :category_project_ships

end
