class WarehouseProductDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_price currency = 'EUR'
    if object.send("price_#{currency.downcase}").present?
      _price = object.send("price_#{currency.downcase}")
      symbol = currency
    else
      _price = price_eur
      symbol = 'EUR'
    end
    format_price symbol, _price
  end

  def formatted_price_after_discount currency = 'EUR'
    _currency = support_currency?(currency) ? currency : User::EUR
    _price = price_after_discount _currency
    format_price _currency, _price
  end
end
