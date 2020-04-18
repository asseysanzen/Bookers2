Rails.application.routes.draw do
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  get 'home' => 'books#home'
  get 'home/about' => 'books#about'
  resources :users, only: [:show, :index, :edit, :update]
end
