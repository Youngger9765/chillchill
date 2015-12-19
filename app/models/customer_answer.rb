class CustomerAnswer < ActiveRecord::Base

  belongs_to :question
  belongs_to :registration_form

end
