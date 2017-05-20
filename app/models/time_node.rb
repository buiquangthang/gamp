class TimeNode < ApplicationRecord
  after_create :update_links_after_create
  after_update :update_links_after_update
  after_destroy :destroy_links

  belongs_to :bus_route
  belongs_to :bus_station
  belongs_to :list_time_node

  scope :of_ids, -> node_ids do
    where(id: node_ids)
  end

  def update_links_after_create
    nodes = TimeNode.where(bus_station: bus_station).order("arrival_time asc")
    nodes.each do |node|
      next if node.id == id || node.bus_route_id == bus_route_id
      if node.arrival_time > arrival_time
        Link.create origin: id, destination: node.id, cost: node.arrival_time - arrival_time
      else
        Link.create origin: node.id, destination: id, cost: arrival_time - node.arrival_time
      end
    end

    nodes_inside_bus_route = TimeNode.where(bus_station: bus_station, bus_route_id: bus_route_id).order("arrival_time asc")
    return if nodes_inside_bus_route.size < 2
    index_current_node = nodes_inside_bus_route.index(self)
    if index_current_node == 0
      Link.create origin: id, destination: nodes_inside_bus_route[1].id, cost: nodes_inside_bus_route[1].arrival_time - arrival_time
    elsif index_current_node == nodes_inside_bus_route.length - 1
      Link.create origin: nodes_inside_bus_route[index_current_node - 1].id, destination: id, cost: arrival_time - nodes_inside_bus_route[index_current_node - 1].arrival_time
    else
      Link.where(origin: nodes_inside_bus_route[index_current_node - 1], destination: nodes_inside_bus_route[index_current_node + 1]).delete_all
      Link.create origin: nodes_inside_bus_route[index_current_node - 1].id, destination: id, cost: arrival_time - nodes_inside_bus_route[index_current_node - 1].arrival_time
      Link.create origin: id, destination: nodes_inside_bus_route[index_current_node + 1].id, cost: nodes_inside_bus_route[index_current_node + 1].arrival_time - arrival_time
    end
  end

  def update_links_after_update
    nodes = TimeNode.where(bus_station: bus_station).order("arrival_time asc")
    nodes.each do |node|
      next if node.id == id || node.bus_route_id == bus_route_id
      if node.arrival_time > arrival_time
        Link.where(destination: id).update_all(origin: id, destination: node.id)
      else
        Link.where(origin: id).update_all(origin: node.id, destination: id)
      end
    end
  end

  def destroy_links
  end
end
