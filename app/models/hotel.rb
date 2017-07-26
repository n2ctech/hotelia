class Hotel < ApplicationRecord
  belongs_to :location
  belongs_to :chain

  validates :location, :chain, presence: true
end
