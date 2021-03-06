Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # My_dogs routes
  get "/my_dogs", to: "dogs#my_dogs"
  get "/my_dogs/:id", to: 'dogs#my_dog', as: 'my_dog'

  # Reservations routes
  get "/my_reservations", to: "reservations#my_reservations"
  get "/my_dogs_reservations", to: 'reservations#my_dogs_reservations', as: 'my_dogs_reservations'
  patch '/my_dogs_reservation/:id/confirm', to: 'reservations#confirm_reservation', as: 'confirm_reservation'
  patch '/my_dogs_reservations/:id/decline', to: 'reservations#decline_reservation', as: 'decline_reservation'

  # routes for search
  get '/search', to: "pages#search", as: 'new_search'
  post '/search', to: "pages#create_search", as: 'create_search'

  resources :dogs do
    resources :reservations, except: %i[show destroy update edit index]
  end
end
