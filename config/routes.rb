Rails.application.routes.draw do
  resources :user_teams
  resources :teams
  resources :posts
  resources :projects
  resources :users, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get '/', to: 'application#home'
   get '/users/:slug', to: 'users#show'



  
end
