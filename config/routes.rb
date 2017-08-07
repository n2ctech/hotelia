Rails.application.routes.draw do
  root to: "warehouse_products#index"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :warehouse_products
  resources :cart_items
  resource :cart
  resources :tags

  patch 'change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  patch 'change_currency/:currency', to: 'settings#change_currency', as: :change_currency
end
