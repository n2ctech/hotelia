ActiveAdmin.register Supplier do
  permit_params :name, :info

  index do
    selectable_column
    id_column
    column :name
    column :info
    actions
  end

  form do |f|
    f.inputs "Supplier Details" do
      f.input :name
      f.input :info
    end
    f.actions
  end
end
