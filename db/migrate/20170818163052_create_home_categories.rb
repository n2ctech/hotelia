class CreateHomeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :home_categories do |t|
      t.integer :home_config_id, index: true, null: false
      t.integer :category_id, index: true, null: false

      t.timestamps
    end
  end
end
