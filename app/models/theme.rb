class Theme < ApplicationRecord
  validates :title, presence: true,length: { maximum: 75 } 
  validates :content, presence: true,length: { maximum: 255 } 
  validates :reword, presence: true, length: { maximum: 75 } 
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_many :ideas, dependent: :destroy
  has_many :users, through: :ideas
  mount_uploader :img, ImageUploader
  
  def self.ransackable_associations(auth_object = nil)
    %w[labels user]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[content created_at id title updated_at user_id label_id]
  end
end
