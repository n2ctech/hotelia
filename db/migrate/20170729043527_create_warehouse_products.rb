class CreateWarehouseProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouse_products do |t|
      t.integer :warehouse_id, null: false, index: true
      t.integer :product_id, null: false, index: true
      t.integer :stock
      t.float :price
      t.float :discount, default: 0

      t.timestamps
    end
  end
end
