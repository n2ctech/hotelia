ActiveAdmin.register Brand do
  permit_params :name, *Brand.locale_columns(:description)

  index do
    selectable_column
    id_column
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs "Brand Details" do
      f.input :name
      Brand.locale_columns(:description).each do |column|
        f.input column
      end
    end
    f.actions
  end
end
