# @param {String[]} nums
# @return {String}
def find_different_binary_string(nums)
    length = nums.length
    number = ''
    (0...length).each do |i|
        number += (nums[i][i] == '1' ? '0' : '1')
    end
    number
end
