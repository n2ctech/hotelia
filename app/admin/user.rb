ActiveAdmin.register User do
  actions :all, except: [:new]
  permit_params :email, :password, :password_confirmation, :locale, :currency

  index do
    selectable_column
    id_column
    column :hotel
    column :email
    column :locale
    column :currency
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :locale
  filter :currency
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :locale
      f.input :currency
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
