def shuffle(nums, n)
    first_half  = nums[0..n - 1]
    second_half = nums[n..-1]
    result      = []

    for i in (0..n - 1) do
        result.push(first_half[i])
        result.push(second_half[i])
    end

    result
end
