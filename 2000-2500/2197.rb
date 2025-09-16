def replace_non_coprimes(nums)
    res = []
    nums.each do |ele|
        loop do
            gcd = (res.last || 1).gcd(ele)
            break if gcd == 1
            ele *= res.pop/gcd
        end
        res<<ele
    end
    res
end
