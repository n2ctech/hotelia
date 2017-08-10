class AddSomeCategoryColumnToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :family_id, :integer
    add_column :products, :subfamily_id, :integer
    add_column :products, :category_id, :integer

    add_index :products, :family_id
    add_index :products, :subfamily_id
    add_index :products, :category_id
  end
end
