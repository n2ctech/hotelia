class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.text :info

      t.timestamps
    end
  end
end
