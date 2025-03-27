# @param {Integer[]} nums
# @return {Integer}
def minimum_index(nums)
  full=nums.tally
  half=Hash.new(0)
  n=nums.size

  nums.each_with_index do |num, i|
    half[num] += 1
    left = half[num]
    right = full[num] - left
    return i if left * 2 > i + 1 && right * 2 > n - i - 1
  end
  -1
end
