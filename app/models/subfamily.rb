class Subfamily < ApplicationRecord
  belongs_to :family

  validates :family, :name, presence: true
end
