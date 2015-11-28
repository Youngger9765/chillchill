class Partner < ActiveRecord::Base

  validates_presence_of :name, :company

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_many :informations, :dependent => :destroy

  has_many :partner_url_ships, :dependent => :delete_all
  has_many :urls, :through => :partner_url_ships, :dependent => :delete_all

  def fb
    self.urls.find_by(:category => "fb")
  end

  def fb_url
    self.urls.find_by(:category => "fb").try(:url)
  end

  def fb_url=(str)
  end

  def blog
    self.urls.find_by(:category => "blog")
  end

  def blog_url
    self.urls.find_by(:category => "blog").try(:url)
  end

  def blog_url=(str)
  end

  def web
    self.urls.find_by(:category => "web")
  end

  def web_url
    self.urls.find_by(:category => "web").try(:url)
  end

  def web_url=(str)
  end

end
