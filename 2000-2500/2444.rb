def count_subarrays(nums, min_k, max_k)
  res = 0
  bad = left = right = -1

  nums.each_with_index do |num, i|
    bad = i if num < min_k || num > max_k
    left = i if num == min_k
    right = i if num == max_k
    res += [0, [left, right].min - bad].max
  end

  res
end
