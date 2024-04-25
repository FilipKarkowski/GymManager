Rails.application.routes.draw do
  get 'pages/home'
  resources :users
  resources :activities
  resources :memberships
  resources :trainings
  root 'pages#home'
end
