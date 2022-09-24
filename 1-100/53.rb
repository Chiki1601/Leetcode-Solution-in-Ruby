def max_sub_array(nums)
  maximum_sum = nums[0]
  current_max_sum = nums[0]
  nums.each_with_index do |num, index|
    next if index.zero?

    current_max_sum = [num, (current_max_sum + num)].max
    maximum_sum = [current_max_sum, maximum_sum].max
  end
  maximum_sum
end

p max_sub_array([1, 2])
p max_sub_array(nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4])
