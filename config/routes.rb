Rails.application.routes.draw do
  get 'home/index'
  get 'home/secret'
  devise_for :users
    resources :home, only: [:index, :secret]
  resources :events
  resources :users, only: [:show, :edit, :update]
  resources :charges, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
