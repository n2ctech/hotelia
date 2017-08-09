class Subfamily < ApplicationRecord
  translates :name

  belongs_to :family

  validates :name_en, presence: true
end
