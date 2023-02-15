class Label < ApplicationRecord
    has_many :labellings, :dependent: :destroy
    has_many :themes, through: :labellings
end
