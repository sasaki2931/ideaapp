class Idea < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :theme
  belongs_to :user
  mount_uploader :img, ImageUploader
end
