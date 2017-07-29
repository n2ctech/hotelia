class WarehouseProduct < ApplicationRecord
  belongs_to :warehouse
  belongs_to :product
  belongs_to :chain, optional: true

  validates :price, presence: true

  validates_uniqueness_of :product_id, scope: [:warehouse_id, :chain_id]
  validates_numericality_of :price, :stock, :discount,
    greater_than_or_equal_to: 0
end
