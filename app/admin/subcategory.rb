ActiveAdmin.register Subcategory do
  permit_params :name, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :category
    actions
  end

  form do |f|
    f.inputs "Subcategory Details" do
      f.input :name
      f.input :category
    end
    f.actions
  end
end
