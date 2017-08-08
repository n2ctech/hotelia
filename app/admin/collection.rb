ActiveAdmin.register Collection do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs "Collection Details" do
      Collection.locale_columns(:name).each do |column|
        f.input column
      end
    end
    f.actions
  end
end
