class Node < ApplicationRecord
  after_create :update_links_after_create
  after_update :update_links_after_update

  belongs_to :bus_route
  belongs_to :place

  scope :of_ids, -> node_ids do
    where(id: node_ids)
  end

  def update_links_after_create
    nodes = Node.where(place: place).order("arrival_time asc")
    nodes.each do |node|
      next if node.id == id || node.bus_route_id == bus_route_id
      if node.arrival_time > arrival_time
        Link.create origin: id, destination: node.id
      else
        Link.create origin: node.id, destination: id
      end
    end
  end

  def update_links_after_update
    nodes = Node.where(place: place).order("arrival_time asc")
    nodes.each do |node|
      next if node.id == id || node.bus_route_id == bus_route_id
      if node.arrival_time > arrival_time
        Link.where(destination: id).update_all(origin: id, destination: node.id)
      else
        Link.where(origin: id).update_all(origin: node.id, destination: id)
      end
    end
  end

  def update_links_after_delete
  end
end
