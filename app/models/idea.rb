class Idea < ApplicationRecord
  belongs_to :theme
  belongs_to :user
  mount_uploader :img, ImageUploader
end
