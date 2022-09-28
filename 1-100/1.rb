# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  data = {}

  nums.each_with_index do |num, index|
    data[num] = index
  end

  output = []

  nums.each_with_index do |num, index|
    expected_element = target - num

    if !data[expected_element].nil? && data[expected_element] != index
      output = [index, data[expected_element]]
      return output
    end
  end

  output

end

p two_sum([2, 7, 11, 15], 9)
