class User < ActiveRecord::Base
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:freelancer, :client, :admin]

  has_many :projects, :foreign_key => 'freelancer_id'

  def self.from_omniauth(auth)
    @user = find_by(provider: auth.provider, uid: auth.uid)
    if @user
      @user
    else
      @user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  def set_default_role
    self.role ||= :freelancer
  end

end
