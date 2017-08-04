class WarehouseProduct < ApplicationRecord
  paginates_per 15

  belongs_to :warehouse
  belongs_to :product
  belongs_to :chain, optional: true

  validates :price, presence: true

  validates_uniqueness_of :product_id, scope: [:warehouse_id, :chain_id]
  validates_numericality_of :price, :stock, :discount,
    greater_than_or_equal_to: 0

  before_save :set_price_after_discount

  delegate :name, :description, :first_image, to: :product, prefix: true

  def set_price_after_discount
    self.price_after_discount = price - discount
  end
end
