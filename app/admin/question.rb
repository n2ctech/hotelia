ActiveAdmin.register Question do
  permit_params *Question.locale_columns(:question, :answer)

  index do
    selectable_column
    id_column
    column :question
    actions
  end

  form do |f|
    f.inputs "English" do
      f.input :question_en
      f.input :answer_en
    end
    f.inputs "Spanish" do
      f.input :question_es
      f.input :answer_es
    end
    f.inputs "Portugese" do
      f.input :question_pt
      f.input :answer_pt
    end
    f.actions
  end
end
