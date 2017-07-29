class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
end
