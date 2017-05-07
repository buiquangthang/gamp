class Graph
  attr_accessor :nods
  attr_accessor :edges

  def initialize
    @nods = []
    @edges = []
  end

  def add_node(node)
    nods << node
    node.graph = self
  end

  def add_edge(from, to, weight)
    edges << Edge.new(from, to, weight)
  end
end
