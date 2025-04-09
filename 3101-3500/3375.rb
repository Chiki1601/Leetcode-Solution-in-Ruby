# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
  nums.min < k ? -1 : nums.uniq.size - (nums.min == k ? 1 : 0)
end
