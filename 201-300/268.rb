# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  data = {}
  nums.each do |num|
    data.merge! num => true
  end

  total_nums = nums.length + 1

  (0..total_nums).to_a.each do |num|
    return num if data[num].nil?
  end

end

p missing_number [3, 0, 1]
p missing_number [0, 1]
p missing_number [9, 6, 4, 2, 3, 5, 7, 0, 1]
