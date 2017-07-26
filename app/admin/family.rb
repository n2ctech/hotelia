ActiveAdmin.register Family do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs "Family Details" do
      f.input :name
    end
    f.actions
  end
end
