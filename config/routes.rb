Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  root 'users#new'
end