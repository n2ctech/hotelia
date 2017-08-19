class CreateHomeProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :home_products do |t|
      t.integer :home_config_id, index: true, null: false
      t.integer :product_id, index: true, null: false
      t.string :association_type

      t.timestamps
    end
  end
end
