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
      Family.locale_columns(:name).each do |column|
        f.input column
      end
    end
    f.actions
  end
end
