class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    has_many :trainings
    has_many :instructors, through: :trainings

    validates_presence_of :username, :email
    validates_format_of :email, with: /@/
    validates_uniqueness_of :email, case_sensitive: false
    validates_uniqueness_of :username, case_sensitive: false

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.username = auth.info.nickname
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end
