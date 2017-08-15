module ApplicationHelper
  def per_page_options
    options = [5, 10, 15, 20, 25, 50]

    select_tag :per_page,
      options_for_select(options, params[:per_page])
  end

  def bootstrap_class_for flash_type
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def cart_currency
    return @cart_currency if @cart_currency
    current_user.cart_items.each do |cart_item|
      next if cart_item.warehouse_product.support_currency?(current_user.currency)
      return @cart_currency = User::EUR
    end
    @cart_currency = current_user.currency
  end

  def cart_total
    current_user.cart_items.map do |item|
      item_price = item.total(cart_currency)
      return 0 if item_price.to_f == 0
      item_price
    end.sum
  end

  def formatted_cart_total
    total = cart_total
    if total == 0 && current_user.cart_items.length > 0
      return I18n.t("helper.ask_for_price")
    else
      format_price cart_currency, total
    end
  end
end
