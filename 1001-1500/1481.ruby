# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
    if k > arr.length - 2
        return 0 if k > arr.length - 1
        return 1
    end
    num_hash = Hash.new(0)
    arr.each {|num| num_hash[num]+=1 }
    nums = num_hash.values.sort
    while k > 0
        if k >= nums[0]
            k -= nums[0]
            nums.shift
        else
            k = 0
        end
    end
    nums.length
end
