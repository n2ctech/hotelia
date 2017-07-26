ActiveAdmin.register Hotel do
  permit_params :name, :location_id, :chain_id

  index do
    selectable_column
    id_column
    column :name
    column :location
    column :chain
    actions
  end

  form do |f|
    f.inputs "Hotel Details" do
      f.input :name
      f.input :location
      f.input :chain
    end
    f.actions
  end
end
