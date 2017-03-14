require 'pry'

@graph = {}
graph['start']      = {}
graph['start']['a'] = 6
graph['start']['b'] = 2
graph['a']          = {}
graph['a']['fin']   = 1
graph['b']          = {}
graph['b']['a']     = 3
graph['b']['fin']   = 5

@costs = {
  'a' => 6,
  'b' => 2,
  'fin' => Float::INFINITY
}

@parents = {
  'a'   => 'start',
  'b'   => 'start',
  'fin' => ''
}

@processed = []

def find_lowest_cost_node
  lowest_cost = Float::INFINITY
  lowest_cost_node = nil
  @costs.keys.each do |node|
    cost = @costs[node]
    binding.pry
    if cost < lowest_cost && !@processed.include?(node)
      lowest_cost = cost
      lowest_cost_node = node
    end
  end
  lowest_cost_node
end

node = find_lowest_cost_node(costs)
while node.length > 0
  cost = @costs[node]
  neighbors = @graph[node]
  neighbors.keys.each do |n|
    new_cost = cost + neighbors[n]
    if @costs[n] > new_cost
      @costs[n] = new_cost
      @parents[n] = node
    end
  end
  @processed << node
  node = find_lowest_cost_node(costs)
end

binding.pry

blah = 2
