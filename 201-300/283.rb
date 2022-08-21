# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  count = nums.length

  index = 0

  count.times.each do |i|
    if nums[i] != 0
      nums[index] = nums[i]
      index += 1
    end
  end

  (index..count - 1).each do |i|
    nums[i] = 0
  end

  nums
end

p move_zeroes [0,1,0,3,12]
