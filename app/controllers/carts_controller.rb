class CartsController < BaseController
  def show
    @cart_items = current_user.cart_items
  end

  def update
    if current_user.update cart_params
      flash[:success] = t(".update_cart_success")
    else
      flash[:danger] = t(".update_cart_failure")
    end
    redirect_to request.referer
  end

  def clone_order
    result = UpsertCartItemsByOrder.call current_user, params[:order_uid]

    if result.success?
      flash[:success] = t(".clone_order_success")
      redirect_to cart_path
    else
      flash[:danger] = t(".clone_order_failure")
      redirect_to request.referer
    end
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
