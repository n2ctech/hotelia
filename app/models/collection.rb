class Collection < ApplicationRecord
  translates :name

  validates :name_en, presence: true
end
