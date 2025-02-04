# @param {Integer[]} nums
# @return {Integer}
def max_ascending_sum(nums)
  max_sum = nums[0]
  cur_sum = nums[0]
  (1...nums.length).each do |i|
    cur_sum = nums[i-1] < nums[i] ? cur_sum + nums[i] : nums[i]
    max_sum = [max_sum, cur_sum].max
  end
  max_sum
end
