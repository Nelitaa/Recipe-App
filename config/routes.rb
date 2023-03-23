Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shoping_list', to: 'foods#general_shoping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
end
