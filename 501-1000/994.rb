require 'set'
def oranges_rotting(grid)
  fresh = Set.new
  rotten = Set.new
  number_of_rows = grid.length
  return -1 if number_of_rows.zero?
  return -1 if grid[0].nil?

  number_of_columns = grid[0].length

  number_of_rows.times.each do |row|
    number_of_columns.times.each do |column|
      fresh.add "#{row}-#{column}" if grid[row][column] == 1
      rotten.add "#{row}-#{column}" if grid[row][column] == 2
    end
  end
  minutes = 0
  until fresh.empty?
    newly_rotten_oranges = Set.new
    rotten.each do |rotten_orange|
      i = rotten_orange.split('-').first.to_i
      j = rotten_orange.split('-').last.to_i
      adjacent_elements = [
        "#{i - 1}-#{j}",
        "#{i + 1}-#{j}",
        "#{i}-#{j - 1}",
        "#{i}-#{j + 1}"
      ]

      adjacent_elements.each do |adjacent_element|
        next unless fresh.include? adjacent_element

        fresh.delete adjacent_element
        newly_rotten_oranges.add adjacent_element
      end
    end
    return -1 if newly_rotten_oranges.empty? && !fresh.empty?

    rotten.merge newly_rotten_oranges
    newly_rotten_oranges = Set.new
    minutes += 1
  end
  minutes
end

p oranges_rotting [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
p oranges_rotting [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
