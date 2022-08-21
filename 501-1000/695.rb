def max_area_of_island(grid)
  max_area = 0
  return max_area if grid.nil?

  number_of_rows = grid.length
  return max_area if number_of_rows.zero?

  number_of_columns = grid[0].length
  return max_area if number_of_columns.zero?


  number_of_rows.times.each do |row_index|
    number_of_columns.times.each do |column_index|
      element = grid[row_index][column_index]
      next if element.zero?

      if element == 1
        grid, count = mark_adjacents_as_visited(grid, row_index, column_index)
        max_area = [max_area, count].max
      end
    end
  end
  max_area
end

def mark_adjacents_as_visited(grid, row_index, column_index)
  count = 0
  number_of_rows = grid.length
  number_of_columns = grid[0].length

  if row_index.negative? || row_index >= number_of_rows || column_index.negative? || column_index >= number_of_columns
    return [grid, count]
  end

  element = grid[row_index][column_index]
  return [grid, count] if element.zero?

  count += 1
  grid[row_index][column_index] = 0

  grid, _count = mark_adjacents_as_visited(grid, row_index - 1, column_index) #top
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index + 1, column_index) #bottom
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index, column_index - 1) #Left
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index, column_index + 1) #right
  count += _count
  [grid, count]
end

p max_area_of_island [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                      [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                      [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
                      [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]
