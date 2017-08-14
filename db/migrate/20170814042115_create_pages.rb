class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title_en, null: false, default: ''
      t.string :title_es, null: false, default: ''
      t.string :title_pt, null: false, default: ''
      t.text :content_en, null: false, default: ''
      t.text :content_es, null: false, default: ''
      t.text :content_pt, null: false, default: ''
      t.string :key

      t.timestamps
    end
    add_index :pages, :key, unique: true
  end
end
