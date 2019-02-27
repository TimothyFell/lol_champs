Rails.application.routes.draw do
  get '/', to: 'champions#index', as: 'champions'
  get '/', to: 'champions#index', as: 'root'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create', as:'users'

  get '/champions/:name', to: 'champions#show', as: 'champion'

  post '/favorites/:name', to: 'favorites#create', as: 'favorites'
  delete '/favorites/:name', to: 'favorites#destroy'

  get '/my_favorites', to: 'favorites#index', as:'my_favorites'
end
