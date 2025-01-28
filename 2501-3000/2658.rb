# @param {Integer[][]} grid
# @return {Integer}
def find_max_fish(grid)
  dir = [0, 1, 0, -1, 0]
  y_len, x_len = grid.length, grid[0].length
  seen = Array.new(y_len) { Array.new(x_len, false) }
  res = 0

  for y in 0...y_len
    for x in 0...x_len
      next if grid[y][x] == 0 || seen[y][x]

      frontier = [[y, x]]
      cnt = grid[y][x]
      seen[y][x] = true

      while !frontier.empty?
        new_frontier = []
        frontier.each do |v|
          for i in 0...4
            y_, x_ = v[0] + dir[i], v[1] + dir[i + 1]
            next if y_ < 0 || x_ < 0

            if y_ < y_len && x_ < x_len && grid[y_][x_] > 0 && !seen[y_][x_]
              seen[y_][x_] = true
              cnt += grid[y_][x_]
              new_frontier << [y_, x_]
            end
          end
        end
        frontier = new_frontier
      end

      res = [res, cnt].max
    end
  end

  res
end
