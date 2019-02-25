Rails.application.routes.draw do
  get '/', to: 'champions#index', as: 'champions'
end
