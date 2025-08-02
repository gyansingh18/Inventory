Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :cateogories, only: [:new, :create]
  resources :sales_orders, only: [:index, :new, :create]
  resources :customers, only: [:new, :create]
  resources :suppliers


  root 'products#index'
end
