ActiveAdmin.register Category do
  permit_params *Category.locale_columns(:name), :subfamily_id

  index do
    selectable_column
    id_column
    column :name
    column :subfamily
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      Category.locale_columns(:name).each do |column|
        f.input column
      end
      f.input :subfamily
    end
    f.actions
  end
end
