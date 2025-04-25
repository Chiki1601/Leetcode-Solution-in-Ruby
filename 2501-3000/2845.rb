def count_interesting_subarrays(nums, modulo, k)
    cnt = Hash.new(0)
    cnt[0] = 1
    prefix = 0
    res = 0
    nums.each do |num|
        prefix += 1 if num % modulo == k
        res += cnt[(prefix - k) % modulo]
        cnt[prefix % modulo] += 1
    end
    res
end
