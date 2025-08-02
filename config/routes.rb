Rails.application.routes.draw do
  resources :products
  resources :cateogories, only: [:new, :create]
  resources :customers
  resources :suppliers
  resources :sales_orders

  root 'products#index'
end
