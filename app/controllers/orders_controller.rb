class OrdersController < ApplicationController
  include ApplicationHelper

  def index
    @orders = current_user.orders
      .includes(order_items: {warehouse_product: :product})
      .order(created_at: :desc)
      .page(params[:page]).per(params[:per_page])
  end

  def new
    @order = Order.new
    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      @order.order_items.build(
        warehouse_product_id: cart_item.warehouse_product_id,
        quantity: cart_item.quantity
      )
    end
  end

  def show
    @order = current_user.orders.find_by_uid params[:uid]
  end

  def create
    result = CreateOrder.call current_user,
      order_params.merge(currency: cart_currency)

    if result.success?
      flash[:success] = t(".create_order_success")
      redirect_to order_path(result.data.uid)
    else
      flash[:danger] = t(".create_order_failure")
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :comment,
      order_items_attributes: [
        :id,
        :warehouse_product_id,
        :quantity
      ]
    )
  end
end
