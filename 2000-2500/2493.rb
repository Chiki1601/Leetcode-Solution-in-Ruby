# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def magnificent_sets(n, edges)
  # Initialize the graph as an adjacency list
  graph = Array.new(n) { [] }
  
  # Build adjacency list from edges
  edges.each do |edge|
    u, v = edge[0] - 1, edge[1] - 1
    graph[u] << v
    graph[v] << u
  end
  
  heights = Array.new(n) { nil }  # Store the maximum height for each node
  total_diameters = 0  # To accumulate the total diameters
  
  # Iterate over all nodes and try to find the maximum height for each component
  (0...n).each do |start|
    bipartite, diameter = bfs_check_and_find_height(start, graph, heights)
    
    if !bipartite
      return -1  # If a component is not bipartite, return -1
    elsif diameter
      total_diameters += diameter  # Add the largest diameter found
    end
  end

  total_diameters
end

# Performs BFS from start to check if the graph is bipartite and find the maximum height
def bfs_check_and_find_height(start, graph, heights)
  n = graph.length
  level = Array.new(n, 0)  # Track BFS levels
  queue = [start]
  level[start] = 1

  max_height = -1  # Track the maximum assigned height
  max_level = 1    # Track the deepest BFS level reached
  all_heights_assigned = true  # Check if all nodes have valid heights

  while !queue.empty?
    v = queue.shift
    max_level = level[v]  # Update the deepest level reached

    # If a node is unprocessed, mark heights as incomplete
    if v != start && heights[v].nil?
      all_heights_assigned = false
    else
      max_height = [max_height, heights[v] || -1].max
    end

    # Traverse neighbors and check bipartiteness
    graph[v].each do |u|
      if level[u] == 0  # First visit to u
        level[u] = level[v] + 1
        queue.push(u)
      elsif (level[u] - level[v]).abs != 1  # Bipartiteness check
        return [false, nil]  # Graph is not bipartite
      end
    end
  end

  heights[start] = max_level  # Assign max BFS level as height for start

  # If all nodes had assigned heights, return the max found height
  if all_heights_assigned
    return [true, [max_height, max_level].max]
  else
    return [true, nil]
  end
end
