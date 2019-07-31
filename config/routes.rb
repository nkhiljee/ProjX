Rails.application.routes.draw do
  resources :user_teams
  # resources :teams, only: [:show]
  resources :posts
  resources :projects
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get '/', to: 'application#home'
   get '/users/:slug', to: 'users#show'
   get '/teams/:slug', to: 'teams#show'
   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy'




  
end
