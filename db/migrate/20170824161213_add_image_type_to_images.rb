class AddImageTypeToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :image_type, :string
    add_index :images, :image_type
  end
end
