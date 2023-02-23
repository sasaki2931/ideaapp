class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 75 } 
  validates :address, presence: true,length: { maximum: 75 } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :themes
  has_many :favorites, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :themes, through: :ideas
end
