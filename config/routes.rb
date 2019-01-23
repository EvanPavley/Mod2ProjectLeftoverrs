Rails.application.routes.draw do
  resources :searches
  resources :ingredients
  resources :recipes
  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
