class Edge
  attr_accessor :src, :dst, :length, :id
  
  def initialize(src, dst, id, length = 1)
    @src = src
    @dst = dst
    @length = length
    @id = id
  end
end
