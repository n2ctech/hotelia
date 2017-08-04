class CartItem < ApplicationRecord
  belongs_to :warehouse_product
  belongs_to :user

  delegate :product, to: :warehouse_product

  validates_numericality_of :quantity, greater_than: 0

  def total_amount
    warehouse_product.price_after_discount * quantity
  end
end
