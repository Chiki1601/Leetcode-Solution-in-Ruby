# @param {Integer[]} nums
# @return {Integer}
def longest_subsequence(nums)
  xor_sum = 0
  all_zero = true

  nums.each do |num|
    xor_sum ^= num
    all_zero = false if num != 0
  end

  return 0 if all_zero
  xor_sum != 0 ? nums.length : nums.length - 1
end
