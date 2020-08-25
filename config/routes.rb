Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :events
  get '/new', to: 'events#new'
  post '/create', to: 'events#create'
  delete '/delete', to: 'events#destroy'
  put '/edit', to: 'events#update'
  resources :invitations, only: [:new, :create]
end
