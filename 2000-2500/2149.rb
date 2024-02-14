# @param {Integer[]} nums
# @return {Integer[]}
def rearrange_array(nums)
    pos = nums.map {|num| num > 0 ? num : nil}.compact
    neg = nums.map {|num| num < 0 ? num : nil}.compact
    ret_array = []
    for i in 0...pos.length
        ret_array<<pos[i]
        ret_array<<neg[i]
    end
    ret_array
end
