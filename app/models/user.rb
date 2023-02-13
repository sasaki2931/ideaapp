class User < ApplicationRecord
  validates :name, presence: true,length: { maximum: 75 } 
  validates :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
