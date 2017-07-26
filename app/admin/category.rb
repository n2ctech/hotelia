ActiveAdmin.register Category do
  permit_params :name, :subfamily_id

  index do
    selectable_column
    id_column
    column :name
    column :subfamily
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :subfamily
    end
    f.actions
  end
end
