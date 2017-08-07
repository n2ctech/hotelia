class WarehouseProductDecorator < Draper::Decorator

  def formatted_price currency = 'EUR'
    if object.send("price_#{currency.downcase}").present?
      _price = object.send("price_#{currency.downcase}")
      symbol = currency
    else
      _price = price_eur
      symbol = 'EUR'
    end
    "#{price_symbol symbol} #{_price}"
  end

  def formatted_price_after_discount currency = 'EUR'
    if object.send("price_after_discount_#{currency.downcase}").to_f > 0
      _price = object.send("price_after_discount_#{currency.downcase}")
      symbol = currency
    else
      _price = price_after_discount_eur
      symbol = 'EUR'
    end
    "#{price_symbol symbol} #{_price}"
  end

  def price_symbol currency
    case currency
    when 'EUR'
      '€'
    when 'USD'
      'U$'
    when 'CVE'
      'C$'
    end
  end
end
