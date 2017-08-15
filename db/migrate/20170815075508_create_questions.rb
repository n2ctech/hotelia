class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question_en, null: false, default: ''
      t.text :answer_en, null: false, default: ''
      t.string :question_es, null: false, default: ''
      t.text :answer_es, null: false, default: ''
      t.string :question_pt, null: false, default: ''
      t.text :answer_pt, null: false, default: ''

      t.timestamps
    end
  end
end
