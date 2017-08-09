class Category < ApplicationRecord
  translates :name

  belongs_to :subfamily

  validates :name_en, presence: true
end
