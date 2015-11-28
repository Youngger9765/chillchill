class Category < ActiveRecord::Base

  validates_presence_of :name, :en_name

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
