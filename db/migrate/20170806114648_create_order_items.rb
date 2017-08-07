class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false, index: true
      t.integer :warehouse_product_id, null: false, index: true
      t.integer :quantity, null: false
      t.float :price, null: false
      t.float :total, null: false

      t.timestamps
    end
  end
end
