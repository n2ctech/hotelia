class CartItem < ApplicationRecord
  belongs_to :warehouse_product
  belongs_to :user

  delegate :product, to: :warehouse_product

  validates_numericality_of :quantity, greater_than: 0

  def total currency
    warehouse_product.price_after_discount(currency) * quantity
  end
end
