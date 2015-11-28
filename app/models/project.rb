class Project < ActiveRecord::Base

  validates_presence_of :name

  has_many :category_project_ships
  has_many :categories, :through => :category_project_ships

end
