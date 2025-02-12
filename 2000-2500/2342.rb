def maximum_sum(nums)
    max = Array.new(82, 0)
    ans = -1
    
    nums.each do |x|
        sum = 0
        temp = x
        while temp != 0
            sum += temp % 10
            temp = temp / 10
        end
        
        if max[sum] != 0
            ans = [ans, x + max[sum]].max
        end
        
        max[sum] = [max[sum], x].max
    end
    
    return ans
end
