def find_cheapest_price(n, flights, src, dst, k)
  neighbors = Hash.new{|h, k| h[k] = []}
  flights.each {|from, to, price|
    neighbors[from] << [price, to]
  }
  queue = neighbors[src].map {|price, to|
    [price, to, k]
  }.sort
  visited = {src => k}
  until queue.empty?
    price, city, remaining = queue.shift
    visited[city] = remaining
    return price if city == dst
    neighbors[city].each {|cost, to|
      next if visited[to] && visited[to] >= remaining
      next_price = price + cost
      index = queue.bsearch_index {|price, _, _| price > next_price} || queue.size
      queue.insert(index, [next_price, to, remaining-1])
    } if remaining > 0
  end
  -1
end
