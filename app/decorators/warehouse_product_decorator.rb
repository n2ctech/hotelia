class WarehouseProductDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_price_after_discount currency = 'EUR'
    _currency = support_currency?(currency) ? currency : User::EUR
    _price = price_after_discount _currency
    return I18n.t("decorator.ask_for_price") if _price.to_f == 0
    format_price _currency, _price
  end

  def discount currency = User::EUR
    object.send "discount_#{currency.downcase}"
  end

  def price currency
    object.send "price_#{currency.downcase}"
  end

  def price_after_discount currency
    object.send "price_after_discount_#{currency.downcase}"
  end

  def saving currency
    return unless price(currency).to_f > 0
    saving_number = price(currency).to_f - price_after_discount(currency).to_f
    saving_rate = (saving_number * 100 / price(currency).to_f).round
    format_price currency, "#{saving_number} (#{saving_rate}%)"
  end
end
