class User < ActiveRecord::Base
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_one :profile, :as => :profile
  has_many :post_actors, :as => :post_actor
  has_many :posts
  has_many :ideas
  acts_as_follower
  acts_as_liker
  has_surveys
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  #Google auth         
   def self.find_for_google_oauth2(access_token)
    data = access_token.info
    logger.debug data.inspect.light_yellow
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      logger.debug "token user exist: #{user}".light_yellow
    end
    #always update for latest user data
    user = User.find_or_initialize_by(:email => access_token.info.email)
    user.update_attributes(name: data["name"],
      provider:access_token.provider,
      email: data["email"],
      uid: access_token.uid ,
      password: Devise.friendly_token[0,20],
      image_url: data["image"]
    )

    logger.debug "signed in user: #{user.inspect}".light_yellow
    return user
   end
   

end
