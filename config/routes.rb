Rails.application.routes.draw do
  get '/', to: 'champions#index', as: 'champions'

  get '/login', to: 'sessions#new', as:'login'

  get '/champions/:name', to: 'champions#show', as: 'champion'
  post '/favorites/:name', to: 'favorites#create', as: 'favorites'
end
