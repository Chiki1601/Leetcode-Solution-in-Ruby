def ways_to_split_array(nums)
    leftSideSum = 0
    rightSideSum = nums.sum
    validSplits = 0

    (0...nums.length - 1).each do |i|
        leftSideSum += nums[i]
        rightSideSum -= nums[i]
        validSplits += 1 if leftSideSum >= rightSideSum
    end

    return validSplits
end
