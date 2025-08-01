Rails.application.routes.draw do
  resources :categories
  resources :customers
  resources :products
  resources :suppliers



  resources :sales_orders

  root 'products#index'
end
