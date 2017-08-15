class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :warehouse_product
  delegate :product, to: :warehouse_product
  delegate :name, to: :product, prefix: true

  def calculate_total
    if price.to_f == 0
      self.price = warehouse_product.price_after_discount(order.currency)
    end
    self.total = price * quantity.to_i
  end
end
