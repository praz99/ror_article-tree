Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#home'
  get '/signup', to: 'users#new'
  resources :users
end
