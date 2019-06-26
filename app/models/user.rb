class User < ApplicationRecord


  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    has_many :trainings
    has_many :instructors, through: :trainings

    # validates_presence_of :email
    # validates_format_of :email, with: /@/
    validates :email, uniqueness: true
    validates :username, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.username = auth.info.nickname
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end

  def email_changed?
    false
  end
end
