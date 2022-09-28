# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  data = {}
  numbers.each_with_index do |number, index|
    data[number] = index + 1
  end

  numbers.each_with_index do |number, index|
    return [index + 1, data[target - number]] unless data[target - number].nil?
  end
end

p two_sum [2, 7, 11, 15], 9
