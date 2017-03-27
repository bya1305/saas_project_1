Rails.application.routes.draw do
  resources :contacts
  get '/about' => 'pages#about'
  root to: 'pages#home'
end
