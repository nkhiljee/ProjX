Rails.application.routes.draw do
  resources :user_teams
  resources :teams, only: [:index, :new, :create]
  resources :posts
  resources :projects
  resources :users, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get '/', to: 'application#home'
   get '/users/:slug', to: 'users#show'
   get '/teams/:slug', to: 'teams#show'
   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   post '/logout', to: 'sessions#destroy'




  
end
