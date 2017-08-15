class CreateOrder
  class << self
    def call current_user, order_params
      order = current_user.orders.build order_params

      ActiveRecord::Base.transaction do
        order.save!
        order.user.cart_items.each &:destroy!
      end
      ServiceResult.new success: true, data: order
    rescue ActiveRecord::RecordInvalid => e
      ServiceResult.new success: false, data: order, errors: [e]
    end
  end
end
