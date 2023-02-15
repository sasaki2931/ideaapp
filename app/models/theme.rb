class Theme < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :labellings, :dependent: :destroy
  has_many :labels, through: :labellings
end
