Rails.application.routes.draw do
  root 'application#splash'
  resources :categories
  resources :exercises
  resources :workouts
  resources :workout_sets, only: [:new, :create, :edit, :update, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
