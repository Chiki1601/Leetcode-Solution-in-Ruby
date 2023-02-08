# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  current_jump = 0
  last_jump = 0
  step = 0
  
  (nums.size - 1).times do |i|
    current_jump = [current_jump, i + nums[i]].max
    if i == last_jump
      step += 1
      last_jump = current_jump
    end
  end
  step
end
