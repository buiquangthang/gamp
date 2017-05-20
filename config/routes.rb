Rails.application.routes.draw do
  resources :bus_lines
  get 'search/index'

  devise_for :users
  root 'home#index'

  get 'links/index'

  resources :bus_routes do
    resources :timetables
  end
  resources :distances
  resources :bus_stations do
    collection {post :import}
  end

  post "bus_routes/:id/add_bus_stations", to: "bus_routes#add_bus_stations", as: "add_bus_stations"
  post "bus_routes/:id/destroy_bus_stations", to: "bus_routes#destroy_bus_stations", as: "delete_bus_stations"
  post "bus_routes/:id/update_bus_stations", to: "bus_routes#update_bus_stations", as: "update_bus_stations"
  post "bus_routes/:bus_route_id/timetables/update_nodes",
    to: "timetables#update_nodes", as: "update_nodes"
  post "bus_routes/:bus_route_id/timetables/delete_list_node",
    to: "timetables#delete_list_node", as: "delete_list_node"
  get "bus_routes/:id/search_bus_stop", to: "bus_routes#search_bus_stop", as: "search_bus_stations"

  get "home/show_bus_line/:bus_line_id", to: "home#show_bus_line", as: "show_bus_line"
end
