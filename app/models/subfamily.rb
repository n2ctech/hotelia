class Subfamily < ApplicationRecord
  translates :name

  belongs_to :family
  has_many :categories

  validates :name_en, presence: true
end
