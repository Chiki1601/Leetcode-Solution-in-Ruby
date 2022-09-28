# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  data = {}

  nums.each do |num|
    data[num] = data.fetch(num, 0) + 1
  end

  nums.each do |num|
    return num if data[num] == 1
  end
end

p single_number [2, 2, 1]
p single_number [4, 1, 2, 1, 2]
