class QuoteOrdersController < ApplicationController
  include ApplicationHelper

  def create
    quote_order = current_user.quote_orders.build currency: cart_currency
    quote_order.order_items.build order_items_attributes_form_cart
    if quote_order.save
      QuoteOrderMailer.send_quote(current_user, quote_order).deliver_later
      flash[:success] = t('.your_quote_has_been_sent')
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_items_attributes_form_cart
    current_user.cart_items.map do |cart_item|
      cart_item.attributes.slice(*%w(warehouse_product_id quantity))
    end
  end
end
