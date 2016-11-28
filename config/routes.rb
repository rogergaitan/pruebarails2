Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: [:index, :show]
  resources :products, only: [:index]
  resources :orders, only: [:show, :create]
  root "customers#index"
end
