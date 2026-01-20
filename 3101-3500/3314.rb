# @param {Integer[]} nums
# @return {Integer[]}
def min_bitwise_array(nums)
  nums.map { |n| n == 2 ? -1 : n - (((n ^ (n + 1)) + 1) / 4) }  
end
