class CreateWareHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :ware_houses do |t|
      t.string :name, null: false
      t.integer :location_id, index: true

      t.timestamps
    end
  end
end
