class Tag < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true
  validates :name, uniqueness: { case_insensitive: true }
end
