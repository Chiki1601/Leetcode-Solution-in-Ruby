def color_the_grid(m, n)
  nums = [1, 2, 3]
  (m - 1).times do
    nums = nums.flat_map { |num| ([1, 2, 3] - [num % 10]).map { num * 10 + _1 } }
  end
  sz = nums.size
  possible_neighbors = nums.map do |num|
    (0...sz).select { |i| (0...m).all? { num.digits[_1] != nums[i].digits[_1] } }
  end
  counts = Array.new(sz, 1) # counts[i] means number of ways to obtain nums[i] at the current row
  (n - 1).times do
    counts = (0...sz).map { |i| possible_neighbors[i].sum { counts[_1] } }
  end
  counts.sum % 1000000007
end
