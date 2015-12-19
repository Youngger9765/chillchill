class RegistrationForm < ActiveRecord::Base

  validates_presence_of :first_name, :phone_number, :email, :people, :payment ,:message => "請確認 * 必填"
  validates_length_of :first_name, :last_name, :minimum => 2
  validates_numericality_of :phone_number,:people, :only_integer => true
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  
  belongs_to :event
  has_many  :customer_answers

  def day_list(event)
    event.reservation_days.map{ |d| d.day_info }
  end

  def day_list=(str)
    arr = str.split(",")

    self.reservation_days = arr.map do |d|
      reservation_day = ReservationRay.find_by_day_info(d)
      unless reservation_day
        reservation_day = ReservationDay.create!( :day_info => d )
      end
      reservation_day
    end
  end
  
end
