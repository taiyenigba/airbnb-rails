Rails.application.routes.draw do
  devise_for :users
  resources :listings do
    get "photos", to: "listings#photos", on: :member
    
  end

   # Move this outside the listings resource block
  get 'about', to: 'static_pages#about', as: 'about'

  namespace :listings do
    resource :file_uploads, only: [:create], module: :listings 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "listings#index"
end
