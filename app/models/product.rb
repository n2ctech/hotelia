class Product < ApplicationRecord
  validates :name, :code, presence: true

  belongs_to :brand
  belongs_to :supplier
  belongs_to :subcategory
  belongs_to :collection
  has_many :images, as: :attachable
  has_one :first_image, class_name: Image.to_s, as: :attachable

  accepts_nested_attributes_for :images, reject_if: :all_blank,
    allow_destroy: true
end
