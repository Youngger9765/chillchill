class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_one :profile, dependent: :destroy

  after_create :create_profile


  def create_profile
    self.build_profile
    self.profile.save!
    self.profile
  end

  def self.from_omniauth(auth)
      # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
    #   user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      #existing_user.fb_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password

    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.fb_raw_data = auth
    user.role ="normal"
    user.save!
    
    profile = user.create_profile
    profile.username = auth.info.name
    profile.first_name = auth.info.first_name
    profile.last_name = auth.info.last_name
    profile.birthday = auth.extra.raw_info.birthday
    profile.location = auth.info.location
    profile.locale = auth.extra.raw_info.locale
    profile.gender = auth.extra.raw_info.gender

    edu_array =[]    
    auth.extra.raw_info.education.each do |education|
      if education.try(:concentration)
        edu_array << education.school.name + education.concentration[0].name
      else 
        edu_array << education.school.name
      end
      profile.education = edu_array
    end

    profile.fb_image = auth.info.image
    profile.save!

    return user
  end


end
