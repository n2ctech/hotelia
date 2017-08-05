class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, default: ''

      t.timestamps
    end
    add_index :tags, :name, unique: true

    create_table :products_tags do |t|
      t.integer :product_id, null: false, default: ''
      t.integer :tag_id, null: false, default: ''

      t.timestamps
    end
    add_index :products_tags, :product_id
    add_index :products_tags, :tag_id
  end
end
