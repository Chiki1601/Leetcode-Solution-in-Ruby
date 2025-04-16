# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_good(nums, k)
  pair_count = 0
  freq_map = Hash.new(0)  # Default value of 0 for non-existing keys
  result = 0
  l = 0

  # Iterate through the nums array with index r
  nums.each_with_index do |num, r|
    # If num already exists in the map, update the pair_count
    if freq_map.key?(num)
      count = freq_map[num]
      pair_count += count
      freq_map[num] = count + 1
    else
      freq_map[num] = 1
    end

    # While the pair_count is greater than or equal to k, update the result
    while pair_count >= k
      result += nums.length - r

      # Reduce pair_count by the frequency of nums[l] - 1
      left_count = freq_map[nums[l]]
      pair_count -= (left_count - 1)
      freq_map[nums[l]] -= 1
      l += 1
    end
  end

  return result
end
