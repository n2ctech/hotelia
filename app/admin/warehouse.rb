ActiveAdmin.register Warehouse do
  permit_params :name, :location_id

  index do
    selectable_column
    id_column
    column :name
    column :location
    actions
  end

  form do |f|
    f.inputs "Warehouse Details" do
      f.input :name
      f.input :location
    end
    f.actions
  end
end
