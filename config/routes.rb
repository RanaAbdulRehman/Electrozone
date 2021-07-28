Rails.application.routes.draw do
  get 'carts/show'
  resources :products
  resources :brands
  resources :categories
  resources :order_items
  resource :carts, only:[:show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
