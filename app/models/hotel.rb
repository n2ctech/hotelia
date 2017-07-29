class Hotel < ApplicationRecord
  belongs_to :location
  belongs_to :chain

  validates :name, presence: true
end
