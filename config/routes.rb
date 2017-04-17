Rails.application.routes.draw do
  resources :bus_routes
  resources :distances
  resources :places do
    collection {post :import}
  end
  root "bus_routes#index"
  post "bus_routes/:id/add_places", to: "bus_routes#add_places", as: "add_places"
  post "bus_routes/:id/destroy_places", to: "bus_routes#destroy_places", as: "delete_places"
  post "bus_routes/:id/update_places", to: "bus_routes#update_places", as: "update_places"
end
