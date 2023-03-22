# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def min_score(n, roads)
  neighbors = Hash.new{|h, k| h[k] = []}
  roads.each {|a, b, distance|
    neighbors[a] << [distance, b]
    neighbors[b] << [distance, a]
  }
  answer = Float::INFINITY
  queue = [1]
  visited = {}
  until queue.empty?
    node = queue.shift
    next if visited[node]
    visited[node] = true
    neighbors[node].each {|distance, neighbor|
      answer = [answer, distance].min
      queue << neighbor
    }
  end
  answer
end
