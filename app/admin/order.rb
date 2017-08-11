ActiveAdmin.register Order do
  permit_params :user_id, :adjustment_total, :currency,
    order_items_attributes: [
      :id,
      :warehouse_product_id,
      :quantity,
      :_destroy
    ]

  index do
    selectable_column
    id_column
    column :user
    column :total
    column :currency
    column :comment
    actions
  end

  form do |f|
    f.inputs "Order Details" do
      if f.object.new_record?
        f.input :user
      else
        f.input :user, input_html: { disabled: true }
      end
      f.input :currency, as: :select, collection: Order.currencies,
        include_blank: false
      f.input :items_total, input_html: { disabled: true }
      f.input :adjustment_total
      f.input :total, input_html: { disabled: true }
      f.input :comment, input_html: { disabled: true }

      f.has_many :order_items, new_record: true, allow_destroy: true do |order_item|
        order_item.input :warehouse_product, input_html: {class: "select2"}
        order_item.input :quantity
        order_item.input :price, input_html: { disabled: true }
        order_item.input :total, input_html: { disabled: true }
      end
    end
    f.actions
  end
end
