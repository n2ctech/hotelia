class OrderItemDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_total
    _price = object.total
    return I18n.t("decorator.ask_for_price") if _price.to_f == 0
    format_price object.order.currency, _price
  end

  def formatted_price
    _price = object.price
    return I18n.t("decorator.ask_for_price") if _price.to_f == 0
    format_price object.order.currency, _price
  end
end
