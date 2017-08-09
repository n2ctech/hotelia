class Family < ApplicationRecord
  translates :name

  has_many :subfamilies

  validates :name_en, presence: true
end
