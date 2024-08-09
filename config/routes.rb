Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Resources for listings
  resources :listings do
    get "photos", to: "listings#photos", on: :member
  end

  # Static pages
  get 'about', to: 'static_pages#about', as: 'about'

  # Namespaced routes for file uploads
  namespace :listings do
    resource :file_uploads, only: [:create], module: :listings 
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path route
  root "listings#index"
end
