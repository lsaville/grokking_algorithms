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
