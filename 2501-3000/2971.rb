# @param {Integer[]} nums
# @return {Integer}
def largest_perimeter(nums)
  nums.sort!
  prefix_sum = nums.sum
  range = nums.length-1...2
  (range.first).downto(range.last).each { |idx|
    return prefix_sum if nums[idx] < prefix_sum - nums[idx]
    prefix_sum -= nums[idx]
  }
  -1
end
