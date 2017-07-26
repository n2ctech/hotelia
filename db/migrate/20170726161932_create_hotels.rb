class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.integer :location_id, index: true
      t.integer :chain_id, index: true
      t.string :name

      t.timestamps
    end
  end
end
