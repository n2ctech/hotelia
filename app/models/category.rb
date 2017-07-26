class Category < ApplicationRecord
  belongs_to :subfamily

  validates :name, :subfamily, presence: true
end
