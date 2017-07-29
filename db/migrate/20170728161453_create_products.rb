class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :brand_id, index: true
      t.integer :supplier_id, index: true
      t.integer :subcategory_id, index: true
      t.integer :collection_id, index: true
      t.string :name, null: false
      t.text :description
      t.string :code, null: false
      t.text :features

      t.timestamps
    end
  end
end
