class WareHouse < ApplicationRecord
  belongs_to :location

  validates :name, :location, presence: true
end
