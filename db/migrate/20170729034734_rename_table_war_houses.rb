class RenameTableWarHouses < ActiveRecord::Migration[5.1]
  def change
    rename_table :ware_houses, :warehouses
  end
end
