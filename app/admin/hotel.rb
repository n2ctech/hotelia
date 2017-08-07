ActiveAdmin.register Hotel do
  permit_params :name, :location_id, :chain_id, :user_email, :user_password,
    :user_password_confirmation

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
    if f.object.new_record?
      f.inputs "User Login Info" do
        f.input :user_email
        f.input :user_password
        f.input :user_password_confirmation
      end
    end
    f.actions
  end
end
