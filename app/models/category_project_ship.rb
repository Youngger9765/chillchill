class CategoryProjectShip < ActiveRecord::Base

  belongs_to :category
  belongs_to :project

end
