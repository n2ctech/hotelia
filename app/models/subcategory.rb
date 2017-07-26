class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, :category, presence: true
end
