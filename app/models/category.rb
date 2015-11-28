class Category < ActiveRecord::Base

  validates_presence_of :name, :en_name

  has_many :category_project_ships
  has_many :projects, :through => :category_project_ships

  def class_color(id)
    if id%3 == 0
      "btn btn-success btn-lg"
    elsif id%3 == 2
      "btn btn-info btn-lg"
    elsif id%3 == 1
      "btn btn-warning btn-lg"
    end 
  end

end
