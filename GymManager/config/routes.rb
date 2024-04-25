Rails.application.routes.draw do
  resources :schedules
  resources :trainings
  resources :memberships
  resources :users
  get 'pages/home'
  root 'pages#home'
  post 'set_week', to: 'pages#set_week'


end
