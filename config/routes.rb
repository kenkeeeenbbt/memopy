Rails.application.routes.draw do
  root 'friends#index'
  get  '/about',  to: 'home#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post 'guest_login', to: 'sessions#new_guest'

  get '/friends/:id/new', to: 'friends_details#new', as: 'new_friends_detail'
  post '/friends/:id/new', to: 'friends_details#create'

  resources :users
  resources :friends
  resources :friends_details
end