Rails.application.routes.draw do
  get '/', to: 'champions#index', as: 'champions'
  get '/', to: 'champions#index', as: 'root'

  get '/login', to: 'sessions#new', as:'login'
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create', as: 'users'

  get '/champions/:name', to: 'champions#show', as: 'champion'
  post '/favorites/:name', to: 'favorites#create', as: 'favorites'
end
