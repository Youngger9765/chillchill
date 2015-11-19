class Partner < ActiveRecord::Base

  validates_presence_of :name, :company

end
