class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :subfamily_id, null: false, index: true

      t.timestamps
    end
  end
end
