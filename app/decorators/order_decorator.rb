class OrderDecorator < Draper::Decorator
  include CurrencyHelper

  delegate_all

  def formatted_total
    total = object.total
    return I18n.t("decorator.ask_for_price") if total == 0
    format_price object.currency, total
  end
end
