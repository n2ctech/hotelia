class Category < ApplicationRecord
  translates :name

  belongs_to :subfamily
  has_many :subcategories

  has_one :image, as: :attachable

  accepts_nested_attributes_for :image

  validates :name_en, presence: true
end
