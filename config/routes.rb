Rails.application.routes.draw do
  get '/', to: 'champions#index', as: 'champions'

  get '/champions/:name', to: 'champions#show', as: 'champion'
end
