def count_pairs(nums, k)
    res = 0
    
    for i in 0..nums.length-1
        for j in i+1..nums.length-1
            res +=1 if nums[i] == nums[j] && i*j % k == 0
        end
    end
    
    return res
end
