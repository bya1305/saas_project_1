Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :contacts
  get '/about' => 'pages#about'
  root to: 'pages#home'
end
