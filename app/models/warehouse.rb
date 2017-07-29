class Warehouse < ApplicationRecord
  belongs_to :location

  validates :name, :location, presence: true
end
