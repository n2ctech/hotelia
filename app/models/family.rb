class Family < ApplicationRecord
  has_many :subfamilies

  validates :name, presence: true
end
