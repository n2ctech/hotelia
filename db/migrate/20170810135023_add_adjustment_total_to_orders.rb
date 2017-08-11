class AddAdjustmentTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :adjustment_total, :float, default: 0
    add_column :orders, :items_total, :float
  end
end
