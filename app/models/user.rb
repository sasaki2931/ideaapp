class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 75 } 
  validates :address, presence: true,length: { maximum: 75 } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :themes
  has_many :favorites, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :themes, through: :ideas
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'サンプル'
      user.address = '東京' 
    end
  end
  def self.guest_admin
    find_or_create_by!(email: 'vvv@vvv.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = '管理者'
      user.address = '岩手' 
      user.admin = true
    end
  end
end
