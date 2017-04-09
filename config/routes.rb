Rails.application.routes.draw do
  resources :bus_routes
  resources :distances
  resources :places do
    collection {post :import}
  end
  resources :users
  root "users#index"
end
