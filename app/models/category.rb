class Category < ApplicationRecord
  belongs_to :subfamily

  validates :name, presence: true
end
