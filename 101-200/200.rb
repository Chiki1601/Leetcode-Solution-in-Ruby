# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.nil?

  number_of_rows = grid.length
  return 0 if number_of_rows.zero?

  number_of_columns = grid[0].length
  return 0 if number_of_columns.zero?

  number_of_islands = 0
  number_of_rows.times.each do |row_index|
    number_of_columns.times.each do |column_index|
      element = grid[row_index][column_index]
      next if element == '0'

      if element == '1'
        number_of_islands += 1
        grid = mark_adjacents_as_visited(grid, row_index, column_index)
      end
    end
  end

  number_of_islands
end

def mark_adjacents_as_visited(grid, row_index, column_index)
  number_of_rows = grid.length
  number_of_columns = grid[0].length

  if row_index.negative? || row_index >= number_of_rows || column_index.negative? || column_index >= number_of_columns
    return grid
  end

  element = grid[row_index][column_index]
  return grid if element == '0'

  grid[row_index][column_index] = '0'
  grid = mark_adjacents_as_visited(grid, row_index - 1, column_index) #top
  grid = mark_adjacents_as_visited(grid, row_index + 1, column_index) #bottom
  grid = mark_adjacents_as_visited(grid, row_index, column_index - 1) #Left
  grid = mark_adjacents_as_visited(grid, row_index, column_index + 1) #right

  grid
end

p num_islands(
      [['1','1','1','1','0'],['1','1','0','1','0'],['1','1','0','0','0'],['0','0','0','0','0']]
  )
