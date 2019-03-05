Rails.application.routes.draw do
  root 'application#splash'
  get       '/login', to: 'sessions#new'
  post      '/login', to: 'sessions#create'
  delete    '/login', to: 'sessions#destroy', as: '/logout'
  get       '/exercises/search', to: 'exercises#search'
  get       '/contact', to: 'application#contact'
  resources :categories
  resources :exercises
  resources :workouts
  resources :workout_sets, only: [:new, :create, :edit, :update, :destroy]
  resources :users
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
