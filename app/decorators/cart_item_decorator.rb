class CartItemDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_total currency
    _price = total currency
    return I18n.t("decorator.ask_for_price") if _price.to_f == 0
    format_price currency, _price
  end
end
