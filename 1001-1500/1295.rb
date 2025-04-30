# @param {Integer[]} nums
# @return {Integer}
def find_numbers(nums)
    nums.reduce(0) { |acc, num| acc += num.to_s.length % 2 == 0 ? 1 : 0 }
end
