def count_subarrays(nums, k)
    nums.each_with_index.inject([0, 0, 0]) {|(cnt, i, sum), (v, idx)|
        sum += v
        (sum -= nums[i]; i += 1) while (i <= idx) && (sum * (idx - i + 1) >= k)
        [cnt + (idx - i + 1), i, sum]
    }.first
end
