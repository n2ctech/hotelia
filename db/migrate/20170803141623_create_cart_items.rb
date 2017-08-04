class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :user_id, null: false, index: true
      t.integer :warehouse_product_id, null: false, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
