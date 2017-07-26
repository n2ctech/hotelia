class CreateSubfamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :subfamilies do |t|
      t.string :name, null: false
      t.integer :family_id, null: false, index: true

      t.timestamps
    end
  end
end
