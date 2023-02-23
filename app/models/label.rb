class Label < ApplicationRecord
    
    has_many :labellings, dependent: :destroy
    has_many :themes, through: :labellings
    validates :name, presence: true
    def self.ransackable_attributes(auth_object = nil)
      %w[id name created_at updated_at]
    end

    
end
