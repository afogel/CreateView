Rails.application.routes.draw do
  resources :folder, only: [:index]
  resources :image, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "folder#index"
end
