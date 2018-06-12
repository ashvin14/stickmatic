class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :images
  has_one :store

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable,
    :validatable,:omniauthable,
    :omniauth_providers => [ :instagram]

  def self.from_omniauth(auth)
   where(provider: auth.provider).first_or_initialize.tap do |user|
      user.first_name = auth.info.full_name
      user.last_name = auth.info.full_name
      user.email = "yashkhrnr10@gmail.com"
      user.password ="123456"
      user.save!
    end
  end
end
