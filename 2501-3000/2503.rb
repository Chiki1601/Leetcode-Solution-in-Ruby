# @param {Integer[][]} grid
# @param {Integer[]} queries
# @return {Integer[]}
def max_points(grid, queries)
  n, m = grid.size, grid[0].size
  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  answer = Array.new(queries.size, 0)

  sorted_queries = queries.each_with_index.sort
  uf = UnionFind.new(n * m)
  sorted_cells = []
  n.times do |i|
    m.times do |j|
      sorted_cells << Cell.new(i, j, grid[i][j])
    end
  end
  sorted_cells.sort_by!(&:value)
  current_index = 0

  sorted_queries.each do |query, index|
    while current_index < n * m && sorted_cells[current_index].value < query
      row = sorted_cells[current_index].row
      col = sorted_cells[current_index].col
      cell_id = row * m + col
      
      directions.each do |dx, dy|
        new_row = row + dx
        new_col = col + dy
        next if new_row < 0 || new_row >= n || new_col < 0 || new_col >= m || grid[new_row][new_col] >= query

        uf.unite(cell_id, new_row * m + new_col)
      end
      
      current_index += 1
    end
    answer[index] = query > grid[0][0] ? uf.size(0) : 0
  end

  answer
end

class Cell
  attr_accessor :row, :col, :value
  def initialize(row, col, value)
    @row = row
    @col = col
    @value = value
  end
end

class UnionFind
  def initialize(n)
    @d = Array.new(n, -1)
  end

  def root(x)
    return x if @d[x] < 0

    @d[x] = root(@d[x])
  end

  def is_same?(x, y)
    root(x) == root(y)
  end

  def unite(x, y)
    x = root(x)
    y = root(y)
    return if x == y

    x, y = y, x if @d[x] > @d[y]
    @d[x] += @d[y]
    @d[y] = x
  end

  def size(x)
    -@d[root(x)]
  end
end
