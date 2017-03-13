Rails.application.routes.draw do
  resources :distances
  resources :places
  resources :users
  root "users#index"
end
