require 'pry'

class Dijkstra
  attr_reader :graph, :parents
  attr_accessor :costs

  def initialize(graph, costs, parents)
    @graph   = graph
    @costs   = costs
    @parents = parents
  end

  def find_lowest_cost_node
    lowest_cost = Float::INFINITY
    lowest_cost_node = nil
    @costs.keys.each do |node|
      cost = @costs[node]
      if cost < lowest_cost && !@processed.include?(node)
        lowest_cost = cost
        lowest_cost_node = node
      end
    end
    lowest_cost_node
  end

  def walk_the_graph
    node = find_lowest_cost_node
    while node != 'fin'
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
      node = find_lowest_cost_node
    end
  end
end

=begin
@graph = {}
@graph['start']      = {}
@graph['start']['a'] = 6
@graph['start']['b'] = 2
@graph['a']          = {}
@graph['a']['fin']   = 1
@graph['b']          = {}
@graph['b']['a']     = 3
@graph['b']['fin']   = 5
=end

graph = {
  'start' => {
    'a' => 6,
    'b' => 2
  },
  'a' => {
    'fin' => 1
  },
  'b' => {
    'a' => 3,
    'fin' => 5
  }
}

costs = {
  'a' => 6,
  'b' => 2,
  'fin' => Float::INFINITY
}

parents = {
  'a'   => 'start',
  'b'   => 'start',
  'fin' => ''
}

binding.pry

d = Dijkstra.new(graph, costs, parents)
