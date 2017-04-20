Rails.application.routes.draw do
  get 'links/index'

  resources :bus_routes do
    resources :timetables
  end
  resources :distances
  resources :places do
    collection {post :import}
  end
  root "bus_routes#index"
  post "bus_routes/:id/add_places", to: "bus_routes#add_places", as: "add_places"
  post "bus_routes/:id/destroy_places", to: "bus_routes#destroy_places", as: "delete_places"
  post "bus_routes/:id/update_places", to: "bus_routes#update_places", as: "update_places"
  post "bus_routes/:bus_route_id/timetables/update_nodes",
    to: "timetables#update_nodes", as: "update_nodes"
end
