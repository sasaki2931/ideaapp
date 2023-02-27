class Idea < ApplicationRecord
  validates :title, presence: true ,length: { maximum: 75 } 
  validates :content, presence: true,length: { maximum: 255 } 
  belongs_to :theme
  belongs_to :user
  mount_uploader :img, ImageUploader
end
