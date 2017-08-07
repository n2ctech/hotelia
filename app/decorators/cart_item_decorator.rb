class CartItemDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_total currency
    _price = total currency
    format_price currency, _price
  end
end
