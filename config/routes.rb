Rails.application.routes.draw do
  resources :categories
  resources :exercises
  resources :workout_sets
  resources :workouts
  resources :profiles
  resources :histories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
