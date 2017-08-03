class CartItem < ApplicationRecord
  belongs_to :warehouse_product
  belongs_to :user

  delegate :product, to: :warehouse_product

  validates_numericality_of :quantity, greater_than: 0

  def total_price
    quantity * warehouse_product.price
  end
end
