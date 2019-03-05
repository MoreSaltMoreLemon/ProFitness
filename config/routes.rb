Rails.application.routes.draw do
  root 'application#splash'
  get       '/login', to: 'sessions#new'
  post      '/login', to: 'sessions#create'
  delete    '/login', to: 'sessions#destroy', as: '/logout'
  get       '/users/graph', to: 'users#graph'
  get       '/exercises/search', to: 'exercises#search'
  get       '/contact', to: 'pages#contact'
  get       '/about', to: 'pages#about'
  resources :categories
  resources :exercises
  resources :workouts
  resources :workout_sets, only: [:new, :create, :edit, :update, :destroy]
  resources :users
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
