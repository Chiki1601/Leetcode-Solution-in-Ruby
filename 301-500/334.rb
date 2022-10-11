# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  x1 = nums[0]; x2 = nil
  
  nums.each do |num|
    if num <= x1
      x1 = num
    elsif x2 == nil || num <= x2
      x2 = num
    else
      return true
    end
  end
  
  false
end
