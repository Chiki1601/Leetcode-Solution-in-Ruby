# @param {Integer[]} nums
# @return {Integer}
def max_absolute_sum(nums)
  sum = 0
  min_sum = 0
  max_sum = 0
  nums.each do |num|
    sum += num
    max_sum = [max_sum, sum].max
    min_sum = [min_sum, sum].min
  end
  (max_sum - min_sum).abs
end
