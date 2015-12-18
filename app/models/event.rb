class Event < ActiveRecord::Base

  validates_presence_of :name

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  belongs_to :project

  has_many :registration_forms
  has_many :questions

  has_many  :event_reservation_day_ships
  has_many  :reservation_days, :through => :event_reservation_day_ships

  def day_list
    self.reservation_days.map{ |d| d.day_info }
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

  def question_list
    self.questions.map{ |q| q.content }
  end

end
