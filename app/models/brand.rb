class Brand < ApplicationRecord
  translates :description

  validates :name, presence: true
end
