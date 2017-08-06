class CartsController < BaseController
  def show
    @order = Order.new
    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      @order.order_items.build(
        warehouse_product_id: cart_item.warehouse_product_id,
        quantity: cart_item.quantity
      )
    end
  end

  def update
    if current_user.update cart_params
      flash[:success] = t(".update_cart_success")
    else
      flash[:danger] = t(".update_cart_failure")
    end
    redirect_to request.referer
  end

  def cart_params
    params.require(:user).permit(
      cart_items_attributes: [
        :id,
        :quantity
      ]
    )
  end
end
