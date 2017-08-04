class WarehouseProductDecorator < Draper::Decorator
  def formatted_price_after_discount
    "$#{object.price_after_discount}"
  end
end
