class User < ActiveRecord::Base
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:freelancer, :client, :admin]

  has_many :projects, :foreign_key => 'freelancer_id'

  # def self.from_omniauth(auth)
  # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  #   end
  # end


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def set_default_role
    self.role ||= :freelancer
  end

end
