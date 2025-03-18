# @param {Integer[]} nums
# @return {Integer}
def longest_nice_subarray(nums)
  left_idx = res = tally = 0
  (0...nums.size).each { |right_idx|
    while tally & nums[right_idx] > 0
      tally ^= nums[left_idx]
      left_idx += 1
    end
    res = [res, right_idx - left_idx + 1].max
    tally ^= nums[right_idx]
  }
  res
end
