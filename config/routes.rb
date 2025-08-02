Rails.application.routes.draw do
  resources :products
  resources :cateogories, only: [:new, :create]
  resources :sales_orders, only: [:index, :new, :create]
  resources :customers, only: [:new, :create]
  resources :suppliers


  root 'products#index'
end
