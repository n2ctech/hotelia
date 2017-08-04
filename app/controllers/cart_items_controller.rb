class CartItemsController < BaseController
  def create
    cart_item = current_user.cart_items
      .find_by cart_item_params.slice(:warehouse_product_id)
    if cart_item
      quantity = cart_item.quantity + cart_item_params[:quantity].to_i
      cart_item.update quantity: quantity
    else
      cart_item = current_user.cart_items.build cart_item_params
      cart_item.save
    end
    redirect_to request.referer
  end

  def destroy
    cart_item = current_user.cart_items.find params[:id]
    cart_item.destroy
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit :quantity, :warehouse_product_id
  end
end
