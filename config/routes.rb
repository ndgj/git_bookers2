Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :update,:edit]
  resources :users, only: [:show, :edit, :index,:update]
  
end
