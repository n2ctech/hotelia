class Category < ApplicationRecord
  translates :name

  belongs_to :subfamily
  has_many :subcategories

  validates :name_en, presence: true
end
