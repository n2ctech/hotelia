ActiveAdmin.register Subfamily do
  permit_params :name, :family_id

  index do
    selectable_column
    id_column
    column :name
    column :family
    actions
  end

  form do |f|
    f.inputs "Subfamily Details" do
      f.input :name
      f.input :family
    end
    f.actions
  end
end
