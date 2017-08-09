ActiveAdmin.register Subcategory do
  permit_params *Subcategory.locale_columns(:name), :category_id

  index do
    selectable_column
    id_column
    column :name
    column :category
    actions
  end

  form do |f|
    f.inputs "Subcategory Details" do
      Subcategory.locale_columns(:name).each do |column|
        f.input column
      end
      f.input :category
    end
    f.actions
  end
end
