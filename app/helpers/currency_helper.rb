module CurrencyHelper
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

  def format_price currency, price
    "#{price_symbol currency} #{price}"
  end
end
