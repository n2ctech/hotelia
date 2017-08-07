ActiveAdmin.register WarehouseProduct do
  permit_params :warehouse_id, :product_id, :chain_id, :stock, :price_eur, :discount_eur,
    :price_usd, :discount_usd, :price_cve, :discount_cve

  index do
    selectable_column
    id_column
    column :warehouse
    column :product
    column :chain
    column :stock
    column :price_eur
    column :discount_eur
    column :price_usd
    column :discount_usd
    column :price_cve
    column :discount_cve
    actions
  end

  form do |f|
    f.inputs "WarehouseProduct Details" do
      f.input :warehouse
      f.input :product
      f.input :chain
      f.input :stock
    end

    f.inputs "Prices" do
      f.input :price_eur
      f.input :discount_eur
      f.input :price_usd
      f.input :discount_usd
      f.input :price_cve
      f.input :discount_cve
    end

    f.actions
  end
end
