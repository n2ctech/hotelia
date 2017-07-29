ActiveAdmin.register WarehouseProduct do
  permit_params :warehouse_id, :product_id, :stock, :price, :discount

  index do
    selectable_column
    id_column
    column :warehouse
    column :product
    column :stock
    column :price
    column :discount
    actions
  end

  form do |f|
    f.inputs "WarehouseProduct Details" do
      f.input :warehouse
      f.input :product
      f.input :stock
      f.input :price
      f.input :discount
    end
    f.actions
  end
end
