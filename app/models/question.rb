class Question < ActiveRecord::Base
  validates_presence_of :content

  belongs_to :event
end
