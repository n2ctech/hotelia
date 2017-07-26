class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.integer :category_id, null: false, index: true

      t.timestamps
    end
  end
end
