Rails.application.routes.draw do
    
    root 'pages#home'
    
    get '/home', to: 'pages#home'
    
   # get '/trips', to: 'trips#index'
   # get '/trips/new', to: 'trips#new', as: 'new_trip'
   # post '/trips', to: 'trips#create'
   # get '/trips/id:edit', to: 'trips#edit', as: 'edit_trip'
   # patch '/trips/:id', to: 'trips#update'
   # get 'trips/:id', to: 'trips#show', as: 'trip'
   # delete '/trips/:id', to: 'trips#destroy'
    
    resources :trips


end
