Rails.application.routes.draw do
  resources :searches
  resources :ingredients
  resources :recipes
  resources :users

  root 'session#welcome'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  post '/searches/:id' => 'searches#destroy'
  post '/recipes/:id' => 'recipes#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
