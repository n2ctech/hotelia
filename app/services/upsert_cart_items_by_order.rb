class UpsertCartItemsByOrder
  class << self
    def call current_user, order_uid
      order = Order.find_by uid: order_uid
      ActiveRecord::Base.transaction do
        order.order_items.each do |order_item|
          cart_item = current_user.cart_items
            .find_by warehouse_product_id: order_item.warehouse_product_id
          if cart_item
            cart_item.quantity += order_item.quantity
            cart_item.save!
          else
            current_user.cart_items.create!(
              warehouse_product_id: order_item.warehouse_product_id,
              quantity: order_item.quantity
            )
          end
        end
      end
      ServiceResult.new success: true
    rescue ActiveRecord::RecordInvalid => e
      ServiceResult.new success: false
    end
  end
end
