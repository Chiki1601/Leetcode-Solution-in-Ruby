# @param {Integer[][]} graph
# @return {Integer[]}
def eventual_safe_nodes(graph)
  n = graph.length
  
  # Array to store the state of each node
  # 0 = unvisited, 1 = visiting, 2 = safe
  state = Array.new(n, 0)

  # DFS function to check if a node is safe
  def is_safe(node, graph, state)
    case state[node]
    when 1
      return false # Node is being visited, cycle detected
    when 2
      return true  # Node is already safe
    else
      state[node] = 1 # Mark as visiting
      safe = graph[node].all? { |neighbor| is_safe(neighbor, graph, state) }
      state[node] = safe ? 2 : 0 # Mark as safe or reset to unvisited
      return safe
    end
  end

  # Find all safe nodes
  (0...n).select { |node| is_safe(node, graph, state) }
end
