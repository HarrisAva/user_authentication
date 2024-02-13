Rails.application.routes.draw do
  get 'sessions/create'
  get 'users/create'
 resources :users, only:[:create, :show] # test requests
 post '/login', to: 'sessions#create'  # test user session
end
