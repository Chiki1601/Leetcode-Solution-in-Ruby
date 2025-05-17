def sort_colors(nums)
    t = nums.tally
    t.default = 0
    nums[0           ... t[0]]        = [0] * t[0]
    nums[t[0]        ... t[0] + t[1]] = [1] * t[1]
    nums[t[0] + t[1] ..  -1]          = [2] * t[2]
end
