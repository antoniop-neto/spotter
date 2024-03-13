Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'listings', to: 'listings#index'
  get 'listings/:id', to: 'listings#show', as: :listing

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # routes for Bookings
  get "bookings", to: "bookings#index", as: :bookings
  # I want to cancel my bookings
  delete "bookings/:id", to: "bookings#destroy"

  get 'bookings/new', to: 'bookings#new', as: :new_booking
  post 'bookings', to: 'bookings#create'
end
