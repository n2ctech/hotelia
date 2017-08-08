class Subcategory < ApplicationRecord
  translates :name

  belongs_to :category

  validates :name_en, presence: true
end
