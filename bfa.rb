require 'pry'

graph = {}
graph['me']     = ['alice', 'bob', 'claire']
graph['bob']    = ['anuj', 'peggy']
graph['alice']  = ['peggy']
graph['claire'] = ['thom', 'jonny']
graph['anuj']   = []
graph['peggy']  = []
graph['thom']   = []
graph['jonny']   = []

search_queue = []
search_queue += graph['me']
searched = []

def person_is_a_seller(name)
  name[-1] == 'm'
end

def search(search_queue, graph, searched)
  while search_queue.length > 0
    person = search_queue.shift
    if !searched.include?(person)
      if person_is_a_seller(person)
        puts "#{person} is a mango seller!"
        return true
      else
        search_queue += graph[person]
        searched << person
      end
    end
  end
  puts "You have no mango sellers in your network"
  return false
end


search(search_queue, graph, searched)
