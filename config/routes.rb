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
    
    resources :trips do # Embedding the likes and 
       member do 
           post 'like'
       end
    end
    
    
    resources :travellers, except: [:new]
    
    get '/register', to: 'travellers#new'
    
    get '/login', to: "logins#new"
    post '/login', to: "logins#create"
    get '/logout', to: "logins#destroy"
    
    
    #login -> new session
    #logout -> close session
    #post login -> create session
    
end
