class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, index: true
      t.text :comment
      t.float :total
      t.string :uid, index: true

      t.timestamps
    end
  end
end
