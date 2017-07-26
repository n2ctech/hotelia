class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.integer :location_id, index: true, null: false
      t.integer :chain_id, index: true, null: false

      t.timestamps
    end
  end
end
