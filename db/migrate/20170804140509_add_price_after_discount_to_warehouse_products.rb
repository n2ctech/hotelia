class AddPriceAfterDiscountToWarehouseProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :warehouse_products, :price_after_discount, :float
  end
end
