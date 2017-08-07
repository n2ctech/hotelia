class AddPricesAndDiscountToWarehouseProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :warehouse_products, :price, :decimal
    remove_column :warehouse_products, :discount, :decimal
    remove_column :warehouse_products, :price_after_discount, :decimal
    add_column :warehouse_products, :price_eur, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :price_usd, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :price_cve, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :discount_eur, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :discount_usd, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :discount_cve, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :price_after_discount_eur, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :price_after_discount_usd, :decimal, precision: 10, scale: 2
    add_column :warehouse_products, :price_after_discount_cve, :decimal, precision: 10, scale: 2
  end
end
