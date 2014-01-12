class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :game_records
  has_many :games, through: :game_records
  has_many :parties

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create({
        :name => auth.extra.raw_info.name,
        :provider => auth.provider,
        :uid => auth.uid,
        :email => auth.info.email,
        :password => Devise.friendly_token[0, 20],
      })
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_or_create(user_param)
    User.find_or_create_by(uid: user_param[:user_id]) do |user|
      user.provider = 'facebook'
      user.name = user_param[:user_name]
      user.email = user_param[:email].present? ? user_param[:email] : "#{user_param[:user_id]}_#{Time.now.to_i}@poolog.me"
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
