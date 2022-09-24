# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  data = Array.new(m) { Array.new(n)}

  m.times.each do |index|
    data[index][0] = 1
  end

  n.times.each do |index|
    data[0][index] = 1
  end

  m.times.each do |row|
    n.times.each do |column|
      next if row.zero? || column.zero?
      data[row][column] = data[row - 1][column] + data[row][column - 1]
    end
  end

  data[m - 1][n - 1]
end

p unique_paths(7, 3)
p unique_paths(3, 3)
