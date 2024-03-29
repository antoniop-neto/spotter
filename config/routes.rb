Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'listings', to: 'listings#index', as: :listings
  # I want to view and manage my listings
  get "listings/manage", to: "listings#manage", as: :manage_listings
  get 'listings/new', to: 'listings#new', as: :new_listing
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show', as: :listing
  # I want to cancel my listings
  delete "listings/:id", to: "listings#destroy", as: :delete_listing

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # routes for Bookings
  get "bookings", to: "bookings#index", as: :bookings
  # show booking
  # get "bookings/:id", to: "bookings#show", as: :booking
  # I want to cancel my bookings
  delete "bookings/:id", to: "bookings#destroy", as: :delete_booking

  # I want to create bookings for a specific listing
  get 'listings/:listing_id/bookings/new', to: 'bookings#new', as: :new_booking
  post 'listings/:listing_id/bookings', to: 'bookings#create', as: :listing_bookings

  # I want to create review for a specific listing
  get 'listings/:listing_id/reviews/new', to: 'reviews#new', as: :new_review
  post 'listings/:listing_id/reviews', to: 'reviews#create', as: :listing_reviews
end
