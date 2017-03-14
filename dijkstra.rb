require 'pry'

graph = {}
graph['start']      = {}
graph['start']['a'] = 6
graph['start']['b'] = 2
graph['a']['fin']   = 1
graph['b']['a']     = 3
graph['b']['fin']   = 5

costs = {
  'a' => 6,
  'b' => 2,
  fin => Float::INFINITY
}

parents = {
  'a'   => 'start',
  'b'   => 'start',
  'fin' => ''
}

processed = []

node = find_lowest_cost_node(costs)
while node.length > 0
  cost = costs[node]
  neighbors = graph[node]
  neighbors.keys.each do |n|
    new_cost = cost + neighbors[n]
    if costs[n] > new_cost
      costs[n] = new_cost
      parents[n] = node
    end
  end
  processed << node
  node = find_lowest_cost_node(costs)
end

binding.pry

blah = 2
