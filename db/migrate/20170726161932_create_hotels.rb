class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.integer :location_id, null: false, index: true
      t.integer :chain_id, null: false, index: true

      t.timestamps
    end
  end
end
