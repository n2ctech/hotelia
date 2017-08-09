ActiveAdmin.register Subfamily do
  permit_params *Subfamily.locale_columns(:name), :family_id

  index do
    selectable_column
    id_column
    column :name
    column :family
    actions
  end

  form do |f|
    f.inputs "Subfamily Details" do
      Subfamily.locale_columns(:name).each do |column|
        f.input column
      end
      f.input :family
    end
    f.actions
  end
end
