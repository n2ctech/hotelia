class CreateSubfamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :subfamilies do |t|
      t.string :name, null: false
      t.integer :family_id, index: true, null: false

      t.timestamps
    end
  end
end
