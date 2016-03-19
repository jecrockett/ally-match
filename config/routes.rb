Rails.application.routes.draw do
  root 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/game', to: 'games#show'
  get '/highscores', to: 'high_scores#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:update]
    end
  end
end
