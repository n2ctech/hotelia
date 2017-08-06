class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :warehouse_product
  delegate :product, to: :warehouse_product
  delegate :name, to: :product, prefix: true

  def calculate_price
    self.price ||= warehouse_product.price_after_discount
    self.total ||= price * quantity.to_i
  end
end
