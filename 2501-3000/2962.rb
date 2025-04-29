def count_subarrays(nums, k)
    max = nums.max
    left = res = count = 0

    nums.each do |val|
        count += 1 if val == max
        while count >= k
            count -= 1 if nums[left] == max
            left += 1
        end
        res += left
    end

    res
end
