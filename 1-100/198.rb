def rob(nums)
  return 0 if nums.length.zero?
  return nums[0] if nums.length == 1

  data = []
  data[0] = nums[0]
  data[1] = [nums[0], nums[1]].max

  (2..nums.length - 1).to_a.each do |index|
    data[index] = [data[index - 2] + nums[index], data[index - 1]].max
  end

  data.last
end

p rob [1, 2, 3, 1]
p rob [2, 7, 9, 3, 1]
